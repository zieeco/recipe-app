require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'Test Recipe model' do 
    before(:example) do
      @user = User.create(name: 'you', email: 'you@mail.com', password: '1234567')
      @recipe = Recipe.create(user: @user, name: 'meat pie', preparation_time: 5, cooking_time: 20,
                              description: 'Add meat and pie together', public: true)
    end

    it 'check if name is present' do
      @recipe.name = nil
      expect(@recipe).to_not be_valid
    end

     it 'check if preparation time is an integer' do
      @recipe.preparation_time = '1 minute'
      expect(@recipe).to be_valid
    end

    it 'check if cooking time is an integer' do
      @recipe.cooking_time = '3 days'
      expect(@recipe).to be_valid
    end

    it 'check if description is present' do
      @recipe.description = nil
      expect(@recipe).to_not be_valid
    end

    it 'check if public' do
      expect(@recipe.public).to eq true
    end

    it 'can create' do
      expect(@recipe).to be_valid
      expect(@recipe.name).to eq 'meat pie'
      expect(@recipe.preparation_time).to eq '5'
      expect(@recipe.cooking_time).to eq '20'
      expect(@recipe.description).to eq 'Add meat and pie together'
      expect(@recipe.user).to eq @user
    end
  end
end
