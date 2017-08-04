require './models/product'

describe Product do
  it { should have_property   :id }
  it { should have_property   :product }
  it { should have_property   :customer }
  it { should have_property   :measure }
  it { should have_property   :valid_from }
  it { should have_property   :valid_to }
end
