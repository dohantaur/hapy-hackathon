require 'doorkeeper/grape/helpers'

module Hapy::API::V1
  class Base < Grape::API
    version 'v1', using: :path
    helpers Doorkeeper::Grape::Helpers
    helpers do
      def current_user
        User.find_by(id: doorkeeper_token.resource_owner_id) if doorkeeper_token
      end

      def doorkeeper_render_error_with(error)
        status_code = case error.status
                        when :unauthorized
                          401
                        when :forbidden
                          403
                      end
        error!({errors: [{codes: [status_code.to_s], messages: [error.description]}]}, status_code, error.headers)
      end
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      error!({
                 errors: [{message: e.to_s}]
             }, 401)
    end

    resource :green_houses do
      mount Hapy::API::V1::GreenHouses::Base
    end

    resource :program_templates do
      mount Hapy::API::V1::ProgramTemplates::Base
    end

    resource :plant_type_templates do
      mount Hapy::API::V1::PlantTypeTemplates::Base
    end

    resource :plants do
      mount Hapy::API::V1::Plants::Base
    end

    resource :programs do
      mount Hapy::API::V1::Programs::Base
    end

  end

end