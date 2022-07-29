require 'rails_helper'

RSpec.feature 'Recipe#show', type: :feature do
  describe 'test the recipe show page' do
    before(:example) do
      @user = User.create(name: 'you', email: 'you@mail.com', password: '1234567')
      @recipe = Recipe.create!(name: 'meat pie', preparation_time: 5, cooking_time: 20,
                               description: 'Add meat and pie together', public: true, user: @user)
    end

    it 'see the recipe detail' do
      visit recipe_path(@recipe.id)
      expect(page).to have_content 'Add meat and pie together'
      expect(page).to have_content '5'
      expect(page).to have_content '20'
      expect(page).to have_content 'meat pie'
    end
  end
end
