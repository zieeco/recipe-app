require 'rails_helper'

RSpec.describe Food, type: :model do
  describe 'Test model Validation' do
    before(:example) do
      @food = Food.create(name: 'bread', user_id: 10, measurement_unit: 'kg', quantity: 2)
    end

    it 'name should be invalid' do
      @food.name = nil
      expect(@food).to_not be_valid
    end

    it 'test if measurement_unit is integer' do
      @food.measurement_unit = nil
      expect(@food).to_not be_valid
    end

    it 'if qunatity is integer' do
      @food.quantity = '100'
      @food.quantity = nil
      expect(@food).to_not be_valid
    end

    it 'check if price less than 0' do
      @food.price = - 100
      expect(@food).to_not be_valid
    end
  end
end
