require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new name: 'CategoryName'
      @product = Product.new(name: 'ProductName', price_cents: 500, quantity: 3, category: @category)
    end

    it 'returns valid if all parameters exist' do
      expect(@product).to be_valid
    end

    it 'is invalid without a name' do
      @product.name = nil

      expect(@product).to_not be_valid
    end

    it 'is invalid without a price' do
      @product.price_cents = nil

      expect(@product).to_not be_valid
    end

    it 'is invalid without a quantity' do
      @product.quantity = nil

      expect(@product).to_not be_valid
    end

    it 'is invalid without a category' do
      @product.category = nil

      expect(@product).to_not be_valid
    end
  end
end
