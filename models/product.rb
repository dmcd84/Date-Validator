require 'data_mapper'
require 'dm-postgres-adapter'

class Product
  include DataMapper::Resource

  property :id,             Serial
  property :product,        String
  property :customer,       String
  property :measure,        String
  property :value,          Float
  property :valid_from,     Date
  property :valid_to,       Date
end

DataMapper.setup(:default, 'postgres://localhost/ex_tech_test_date_validator')
DataMapper.finalize
DataMapper.auto_upgrade!
