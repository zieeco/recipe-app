require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET /foods' do
    it 'successful' do
      get foods_path
      expect(response).to have_http_status(200)
    end
  end
end
