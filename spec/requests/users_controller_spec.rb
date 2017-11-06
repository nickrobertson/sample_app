require 'rails_helper'

RSpec.describe UsersController, :type => :request do
  describe 'GET #new' do
    it 'returns a 200 custom status code' do
      get signup_path
      expect(response.status).to eq(200)
    end
  end
end