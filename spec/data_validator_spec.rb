require './models/product'
require './date_validator'

describe 'Data Validator: database' do
  it 'should be populated with sample data' do
    expect(Product.count).to eq 9
  end
end

describe Validator do
  let(:validator) { Validator.new }

  describe '#get_target' do
    it 'gets the first record from database' do
      target = validator.get_target(1)
      expect(target.id).to eq 1
    end
  end

  describe '#find_match' do
    it 'should return check message if match for record is found for id = 7' do
      expect(validator.find_match(7)).to eq 'No conflicts found for row 7'
    end
    it 'should return update messgae if match for record is found for id = 1' do
      expect(validator.find_match(1)).to eq 'Update complete: row 1'
    end
  end

  describe '#display' do
    it 'displays each row of the database' do
      expect { validator.display }.to output(/ROW ID | PRODUCT | CUSTOMER | MEASURE | VALID FROM | VALID TO/).to_stdout
    end
  end
end
