# rubocop:disable Metrics/BlockLength
require 'rails_helper'

RSpec.configure do |config|
  # Specify a root folder where Swagger JSON files are generated
  # NOTE: If you're using the rswag-api to serve API descriptions, you'll need
  # to ensure that it's configured to serve Swagger from the same folder
  config.swagger_root = Rails.root.join('swagger').to_s

  # Define one or more Swagger documents and provide global metadata for each one
  # When you run the 'rswag:specs:swaggerize' rake task, the complete Swagger will
  # be generated at the provided relative path under swagger_root
  # By default, the operations defined in spec files are added to the first
  # document below. You can override this behavior by adding a swagger_doc tag to the
  # the root example_group in your specs, e.g. describe '...', swagger_doc: 'v2/swagger.json'
  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'DOCTOR RESERVATION API'
      },
      components: {
        securitySchemes: {
          bearer_auth: {
            type: :http,
            scheme: :bearer
          }
        },
        schemas: {
          User: {
            type: :object,
            properties: {
              id: { type: :integer, example: 2 },
              name: { type: :string, example: 'Scott Wells' },
              email: { type: :string, example: 'scott_wells@test.com' },
              role: { type: :string, example: 'user' }
            }
          },
          Doctor: {
            type: :object,
            properties: {
              id: { type: :integer, example: 2 },
              name: { type: :string, example: 'Scott doctor' },
              specialization: { type: :string, example: 'specialization' },
              photo_dir: { type: :string, example: 'asset/photo.jpg' },
              user_id: { type: :integer, example: 2 }
            }
          },
          Appointment: {
            type: :object,
            properties: {
              id: { type: :integer, example: 2 },
              doctor_id: { type: :integer, example: 2 },
              description: { type: :string, example: 'Scott Wells' },
              datetime_of_appointment: { type: :string, example: '2023-01-21T22:37:47.895Z' },
              created_at: { type: :string, example: '2023-01-11T22:37:47.904Z' }
            }
          },
          status: {
            type: :object,
            properties: {
              code: { type: :integer, example: 200 },
              message: { type: :string, example: 'Signed up sucessfully.' }
            }
          },
          ErrorResponses: {
            type: :object,
            properties: {
              type: :array,
              items: { type: :string, example: 'error message.' }
            }
          }
        }
      }
    }
  }

  # Specify the format of the output Swagger file when running 'rswag:specs:swaggerize'.
  # The swagger_docs configuration option has the filename including format in
  # the key, this may want to be changed to avoid putting yaml in json files.
  # Defaults to json. Accepts ':json' and ':yaml'.
  config.swagger_format = :yaml
end

# rubocop:enable Metrics/BlockLength
