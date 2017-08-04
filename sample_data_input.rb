require_relative 'models/product'

sample_data = [
  ['Widgets', 'Tesco', 'Gross Sales Price', '1', '20130101', '20130401'],
  ['Widgets', 'Tesco', 'Gross Sales Price', '1.5', '20130301', '20131231'],
  ['Widgets', 'Tesco', 'Gross Sales Price', '2', '20130401', '20150101'],
  ['Widgets', 'Tesco', 'Distribution Cost', '5', '20130101', '20130401'],
  ['Widgets', 'Tesco', 'Distribution Cost', '6', '20130301', '20140401'],
  ['Widgets', 'Tesco', 'Distribution Cost', '7', '20131231', '20150101'],
  ['Widgets', 'Asda', 'Gross Sales Price', '100', '00000000', '99999999'],
  ['Widgets', 'Asda', 'Gross Sales Price', '200', '20131231', '20150101'],
  ['Widgets', 'Asda', 'Distribution Cost', '2', '20130301', '20131231'],
  ['Widgets', 'Asda', 'Distribution Cost', '3', '20140401', '20150101']
]

def create_entry(product, customer, measure, value, valid_from, valid_to)
  Product.create(:product => product, :customer => customer, :measure => measure, :value => value, :valid_from => valid_from, :valid_to => valid_to)
end

def add_all_to_db(data)
  data.each{|product, customer, measure, value, valid_from, valid_to|create_entry(product, customer, measure, value, valid_from, valid_to)}
  p 'Sample data imported to database'
end

add_all_to_db(sample_data)
