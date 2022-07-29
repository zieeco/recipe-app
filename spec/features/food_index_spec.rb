require 'rails_helper'

RSpec.feature 'FoodIndices', type: :feature do
  describe 'integration test for food index page' do
    before(:example) do
      @user = User.create(name: 'zieeco', email: 'zieeco@mail.com', password: '1234567')
      @food = Food.create(name: 'Fish', user_id: @user.id, measurement_unit: 'kilogram', price: 20)
      @food = Food.create(name: 'Beans', user_id: @user.id, measurement_unit: 'kilogram', price: 10)
      @food = Food.create(name: 'Rice', user_id: @user.id, measurement_unit: 'kilogram', price: 100)

      visit new_user_session_path

      fill_in 'Email', with: 'zieeco@mail.com'
      fill_in('Password', with: '1234567', match: :prefer_exact)
      click_button 'Log in'

      visit foods_path
    end

    scenario 'check if foods are available' do
      expect(page).to have_content 'Fish'
      expect(page).to have_content 'Beans'
      expect(page).to have_content 'Rice'
    end
  end
end
