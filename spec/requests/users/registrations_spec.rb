# rubocop:disable Metrics/BlockLength
require 'swagger_helper'

RSpec.describe 'users/registrations', type: :request do
  let!(:user_name) { 'Swagger' }
  let!(:user_email) { 'swagger@rswag.com' }
  let!(:user_password) { 'swagger123' }

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
              name: { type: :string, example: 'Swagger' },
              email: { type: :string, example: 'swagger@rswag.com' },
              password: { type: :string, example: 'swagger123' }
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
               schema: { type: :string },
               description: 'bearer token'

        schema type: :object, properties: {
          status: { '$ref' => '#/components/schemas/status' },
          data: {}
        }

        let(:cretentials) do
          {
            user: {
              name: user_name,
              email: user_email,
              password: user_password
            }
          }
        end

        run_test!
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
