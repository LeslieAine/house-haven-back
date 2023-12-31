require 'rails_helper'

security = {
  bearerAuth: {
    type: :http,
    scheme: :bearer,
    bearerFormat: 'JWT'
  }
}
all_tags = [
  { name: 'Users', description: 'Operations related to users' },
  { name: 'Houses', description: 'Operations related to houses' },
  { name: 'Reservations', description: 'Operations related to reservations' }
]
RSpec.configure do |config|
  config.swagger_root = Rails.root.join('swagger').to_s

  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1'
      },
      paths: {},
      components: {
        securitySchemes: security
      },
      tags: all_tags,
      security: [{ bearerAuth: [] }],
      servers: [
        {
          url: 'https://{defaultHost}',
          variables: {
            defaultHost: {
              default: ''
            }
          }
        }
      ]
    }
  }

  config.swagger_format = :yaml
end
