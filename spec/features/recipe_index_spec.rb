require 'rails_helper'

RSpec.feature 'RecipeIndices', type: :feature do
  describe 'Test recipe #index view' do
    before(:example) do
      @user = User.create(name: 'you', email: 'you@gmail.com', password: '1234567')
      @recipe = Recipe.create!(name: 'meat pie', user_id: @user.id, preparation_time: 5, cooking_time: 20,
                               description: 'Add meat and pie together', public: true)

      visit new_user_session_path

      fill_in 'Email', with: 'you@gmail.com'
      fill_in('Password', with: '1234567', match: :prefer_exact)
      click_button 'Log in'

      visit recipes_path
    end

    it 'check if recipes are available' do
      expect(page).to have_content 'meat pie'
    end
  end
end
