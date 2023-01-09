# rubocop:disable Metrics/BlockLength
require 'swagger_helper'

RSpec.describe 'Blogs API', type: :request do
  let!(:user_name) { 'Swagger' }
  let!(:user_email) { 'swagger@rswag.com' }
  let!(:user_password) { 'swagger123' }

  let!(:test_person) do
    User.create(
      name: user_name,
      email: user_email,
      password: user_password
    )
  end

  describe 'login' do
    path '/login' do
      post 'login' do
        consumes 'application/json'
        produces 'application/json'

        parameter name: :cretentials, in: :body, schema: {
          type: :object,
          properties: {
            user: {
              type: :object,
              properties: {
                email: { type: :string, example: 'swagger@rswag.com' },
                password: { type: :string, example: 'swagger123' }
              }
            }
          },
          required: %w[
            email
            password
          ]
        }

        response 200, 'OK' do
          header 'Authorization',
                 schema: { type: :string },
                 description: 'bearer token'

          schema type: :object, properties: {
            status: { '$ref' => '#/components/schemas/status' }
          }

          let(:cretentials) do
            {
              user: {
                email: user_email,
                password: user_password
              }
            }
          end

          run_test!
        end

        response 401, 'Invalid Email or password.' do
          schema type: :object, properties: {
            error: { type: :string, example: 'Invalid Email or password.' }
          }

          let(:cretentials) do
            {
              user: {
                email: 'user_email',
                password: 'user_password'
              }
            }
          end

          run_test!
        end
      end
    end
  end

  describe 'logout' do
    path '/logout' do
      delete 'logout' do
        consumes 'application/json'
        produces 'application/json'

        security [{ bearer_auth: [] }]

        response 401, 'Unauthorized' do
          let(:Authorization) { '' }
          run_test!
        end

        response 200, 'OK' do
          schema '$ref' => '#/components/schemas/status'

          let(:Authorization) do
            Devise::JWT::TestHelpers.auth_headers({}, test_person)['Authorization']
          end

          run_test!
        end
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
