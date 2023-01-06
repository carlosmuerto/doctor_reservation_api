# rubocop:disable Metrics/BlockLength
require 'swagger_helper'

RSpec.describe 'users/registrations', type: :request do
  let!(:test_user_email) do
    'test_user_name@rspec.com'
  end

  let!(:test_user_password) do
    'password'
  end

  let!(:test_user_name) do
    'test_user_name'
  end

  path '/signup' do
    post 'signup' do
      consumes 'application/json'
      produces 'application/json'

      parameter name: :cretentials, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string },
              name: { type: :string }
            }
          }
        },
        required: %w[
          email
          password
          name
        ]
      }

      response 200, 'OK' do
        header 'Authorization',
               schema: :bearer,
               description: 'bearer token'

        schema type: :object, properties: {
          status: { '$ref' => '#/components/schemas/status' },
          data: {}
        }

        let(:cretentials) do
          {
            user: {
              email: test_user_email,
              password: test_user_password,
              name: test_user_name
            }
          }
        end

        run_test!
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
