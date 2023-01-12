# rubocop:disable Metrics/BlockLength
require 'swagger_helper'

RSpec.describe 'appointment', type: :request do
  let!(:test_person) do
    User.create(
      name: 'rspec',
      email: 'rspec@rspec.com',
      password: '123rspec123'
    )
  end

  let!(:test_doctor) do
    Doctor.create(
      name: 'RSpec Doctor A',
      specialization: 'seeding',
      photo: 'photoURL',
      user: test_person
    )
  end

  let!(:test_appointment) do
    Appointment.create(
      user: test_person,
      doctor: test_doctor,
      description: 'seeded description',
      datetime_of_appointment: 10.days.from_now
    )
  end

  path '/appointments' do
    get 'Get appointments List' do
      consumes 'application/json'
      produces 'application/json'

      security [{ bearer_auth: [] }]

      response 401, 'Unauthorized' do
        let(:Authorization) { '' }
        run_test!
      end

      response 200, 'OK' do
        schema type: :array, items: { '$ref' => '#/components/schemas/Appointment' }

        let(:Authorization) do
          Devise::JWT::TestHelpers.auth_headers({}, test_person)['Authorization']
        end

        run_test!
      end
    end

    post 'Create a Appointments' do
      consumes 'application/json'
      produces 'application/json'

      security [{ bearer_auth: [] }]

      parameter name: :Appointment, in: :body, schema: {
        '$ref' => '#/components/schemas/Appointment'
      }

      response 401, 'Unauthorized' do
        let(:Authorization) { '' }

        let(:Appointment) do
          {
            appointment: {
              doctor_id: test_doctor.id,
              description: 'seeded description',
              datetime_of_appointment: 10.days.from_now
            }
          }
        end

        run_test!
      end

      response 422, 'Unprocessable Entity' do
        let(:Authorization) do
          Devise::JWT::TestHelpers.auth_headers({}, test_person)['Authorization']
        end

        let(:Appointment) do
          {
            appointment: {
              doctor_id: test_doctor.id,
              description: 'seeded description'
            }
          }
        end

        run_test!
      end

      response 201, 'Created' do
        schema '$ref' => '#/components/schemas/Appointment'

        let(:Authorization) do
          Devise::JWT::TestHelpers.auth_headers({}, test_person)['Authorization']
        end

        let(:Appointment) do
          {
            appointment: {
              doctor_id: test_doctor.id,
              description: 'seeded description',
              datetime_of_appointment: 10.days.from_now
            }
          }
        end

        run_test!
      end
    end
  end
end

# rubocop:enable Metrics/BlockLength
