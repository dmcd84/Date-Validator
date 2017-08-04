require './models/product'

class Validator

  def display
    products = Product.all(:order => [:id.asc])
    p 'ROW ID' + ' | ' + 'PRODUCT' + ' | ' + 'CUSTOMER' + ' | ' + 'MEASURE' + ' | ' + 'VALID FROM' + ' | ' + 'VALID TO'
    products.each do |product|
      p "#{product.id}" + ' | ' + "#{product.product}" + ' | ' + "#{product.customer}" + ' | ' + "#{product.measure}" + ' | ' + "#{product.value}" + ' | ' + "#{product.valid_from}" + ' | ' + "#{product.valid_to}"
    end
  end

  def get_target(id)
    Product.get(id)
  end

  def find_match(id)
    target = get_target(id)
    base = Product.all(:product => target.product) & Product.all(:customer => target.customer) & Product.all(:measure => target.measure)
    base = base.all(:valid_from.gt => target.valid_from) & base.all(:valid_from.lt => target.valid_to)
    return p "No conflicts found for row #{target.id}" if base.empty?
    update_date(target, base[0])
  end

  def update_date(target, record)
    target.update(:valid_to => record.valid_from-1)
    p "Update complete: row #{target.id}"
  end
end
