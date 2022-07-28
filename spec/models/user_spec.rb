require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Test User model' do
    before(:example) do
      @user = User.create(name: 'you', email: 'you@gmai.com', password: '1234567')
    end

    it 'invalid user' do
      @user.name = nil
      expect(@user).to_not be_valid
    end

    it 'valid user' do
      expect(@user).to_not be_invalid
    end

    it 'sign in' do
      expect(@user.signed_id == 1).to eq false
    end
  end
end
