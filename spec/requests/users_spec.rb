require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /current' do
    context 'with out auth token' do
      it 'returns http unauthorized' do
        get '/users/current'
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'with auth token' do
      let!(:user) do
        User.create(
          name: 'rspec',
          email: 'rspec@rspec.com',
          password: '123rspec123'
        )
      end

      before(:each) do
        headers = {
          'Accept' => 'application/json',
          'Content-Type' => 'application/json'
        }
        auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
        get '/users/current', headers: auth_headers
      end

      it 'returns http unauthorized' do
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
