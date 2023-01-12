# rubocop:disable Metrics/BlockLength
require 'swagger_helper'

RSpec.describe 'doctor', type: :request do
  let!(:test_person) do
    User.create(
      name: 'rspec',
      email: 'rspec@rspec.com',
      password: '123rspec123'
    )
  end

  let!(:test_doctor_a) do
    Doctor.create(
      name: 'RSpec Doctor A',
      specialization: 'seeding',
      photo: 'photoURL',
      user: test_person
    )
  end

  let!(:test_doctor_b) do
    Doctor.create(
      name: 'RSpec Doctor B',
      specialization: 'seeding',
      photo: 'photoURL',
      user: test_person
    )
  end

  path '/doctors' do
    get 'Get Doctors List' do
      consumes 'application/json'
      produces 'application/json'

      security [{ bearer_auth: [] }]

      response 401, 'Unauthorized' do
        let(:Authorization) { '' }
        run_test!
      end

      response 200, 'OK' do
        schema type: :array, items: { '$ref' => '#/components/schemas/Doctor' }

        let(:Authorization) do
          Devise::JWT::TestHelpers.auth_headers({}, test_person)['Authorization']
        end

        run_test!
      end
    end

    post 'Create a Doctor' do
      consumes 'application/json'
      produces 'application/json'

      security [{ bearer_auth: [] }]

      parameter name: :Doctor, in: :body, schema: {
        '$ref' => '#/components/schemas/Doctor'
      }

      response 401, 'Unauthorized' do
        let(:Authorization) { '' }

        let(:Doctor) do
          {
            doctor: {
              name: 'RSpec Doctor',
              specialization: 'RSpec',
              photo: 'photoURL'
            }
          }
        end

        run_test!
      end

      response 422, 'Unprocessable Entity' do
        let(:Authorization) do
          Devise::JWT::TestHelpers.auth_headers({}, test_person)['Authorization']
        end

        let(:Doctor) do
          {
            doctor: {
              name: 'RSpec Doctor',
              specialization: 'RSpec'
            }
          }
        end

        run_test!
      end

      response 201, 'Created' do
        schema '$ref' => '#/components/schemas/Doctor'

        let(:Authorization) do
          Devise::JWT::TestHelpers.auth_headers({}, test_person)['Authorization']
        end

        let(:Doctor) do
          {
            doctor: {
              name: 'RSpec Doctor',
              specialization: 'RSpec',
              photo: 'photoURL'
            }
          }
        end

        run_test!
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
