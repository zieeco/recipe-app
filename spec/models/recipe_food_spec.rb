require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  describe 'Test RecipeFood model' do
    before(:example) do
      @user = User.create(name: 'you', email: 'you@gmai.com', password: '1234567')
      @recipe = Recipe.create(name: 'meat pie', preparation_time: 5, cooking_time: 20,
                              description: 'Add meat and pie together', public: true, user: @user)
      @food = Food.create(name: 'bread', user_id: 10, measurement_unit: 'kg', quantity: 2, user: @user)
      @recipe_food = RecipeFood.create(quantity: 2, recipe: @recipe, food: @food)
    end

    after(:example) do
      Recipe.destroy_all
      Food.destroy_all
      RecipeFood.destroy_all
      User.destroy_all
    end

    it 'create the recipe food' do
      expect(@recipe_food.food).to eq @food
      expect(@recipe_food.recipe).to eq @recipe
      expect(@recipe_food).to be_valid
      expect(@recipe_food.quantity).to eq 2
    end
  end
end
