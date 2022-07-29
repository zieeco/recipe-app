require 'rails_helper'

RSpec.describe 'PublicRecipes', type: :request do
  describe 'GET /public_recipes' do
    it 'successful' do
      get public_recipes_index_path
      expect(response).to have_http_status(200)
    end
  end
end
