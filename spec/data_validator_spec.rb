require './models/product'
require './date_validator'

describe 'Data Validator: database' do
  it 'should be populated with sample data' do
    expect(Product.count).to eq 9
  end
end

describe Validator do
  let(:validator) { Validator.new }

  it 'gets the first record from database' do
    target = validator.get_target(1)
    expect(target.id).to eq 1
  end

  it 'should return true is match is found' do
    expect(validator.find_match(1)).to eq false
  end
end
