require 'rails_helper'

RSpec.describe Product, type: :model do
  describe Product do
    before(:each) do
      @category = Category.create(name: "test")
      @product = @category.products.new
    end
 
    describe 'Validations' do
     # validation tests/examples here
      it "validate name" do
        @product.price = 100
        @product.quantity = 1
        expect(@product).to_not be_valid
      end
      it "validate quantity" do
        @product.price = 100
        @product.name = "test_product"
        expect(@product).to_not be_valid
      end
      it "validate price" do
        @product.name = "test_product"
        @product.quantity = 1
        expect(@product).to_not be_valid
      end
      it "validate category" do
        @product.category = nil
        @product.name = "test_product" 
        @product.price = 100
        @product.quantity = 1
        expect(@product).to_not be_valid
      end
    end
  end
end