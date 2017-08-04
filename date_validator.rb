require './models/product'

class Validator

products = Product.all

  def display(records)
    p 'ROW ID' + ' | ' + 'PRODUCT' + ' | ' + 'CUSTOMER' + ' | ' + 'MEASURE' + ' | ' + 'VALID FROM' + ' | ' + 'VALID TO'
    records.each do |record|
      p "#{record.id}" + ' | ' + "#{record.product}" + ' | ' + "#{record.customer}" + ' | ' + "#{record.measure}" + ' | ' + "#{record.value}" + ' | ' + "#{record.valid_from}" + ' | ' + "#{record.valid_to}"
    end
  end

  def get_target(id)
    Product.get(id)
  end

  def find_match(id)
    target = get_target(id)
    (Product.all(:product => target.product) & Product.all(:customer => target.customer) & Product.all(:measure => target.measure)).nil?
  end
end
