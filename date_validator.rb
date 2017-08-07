require './models/product'

class Validator
  PRODUCTS = Product.all(order: [:id.asc])

  def display
    p 'ROW ID' + ' | ' + 'PRODUCT' + ' | ' + 'CUSTOMER' + ' | ' + 'MEASURE' + ' | ' + 'VALID FROM' + ' | ' + 'VALID TO'
    PRODUCTS.each do |product|
      p product.id.to_s + ' | ' + product.product.to_s + ' | ' + product.customer.to_s + ' | ' + product.measure.to_s + ' | ' + product.value.to_s + ' | ' + product.valid_from.to_s + ' | ' + product.valid_to.to_s
    end
  end

  def get_target(id)
    Product.get(id)
  end

  def find_match(id)
    target = get_target(id)
    base = Product.all(product: target.product) & Product.all(customer: target.customer) & Product.all(measure: target.measure)
    base = base.all(:valid_from.gt => target.valid_from) & base.all(:valid_from.lt => target.valid_to)
    return p "No conflicts found for row #{target.id}" if base.empty?
    update_date(target, base[0])
  end

  def update_date(target, record)
    target.update(valid_to: record.valid_from - 1)
    p "Update complete: row #{target.id}"
  end

  def iterate_rows
    PRODUCTS.each do |product|
      find_match(product.id)
    end
  end
end
