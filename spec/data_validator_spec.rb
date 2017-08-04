require './models/product'

describe 'Data Validator: database' do
  it 'should be populated with sample data' do
    expect(Product.count).to eq 9
  end
end
