module Hapy::API::V1::ProgramTemplates
  class Base < Grape::API

    before do
      doorkeeper_authorize!
    end


    get do
      present :data, ProgramTemplate.all, with: Hapy::Entities::ProgramTemplateEntity
    end

    route_param :id do
      params do
        requires :id, type: Integer
      end
      get do
        program_template = ProgramTemplate.find_by!(id: declared(params).id)
        present :data, program_template, with: Hapy::Entities::OneProgramTemplateEntity
      end

      resource :plant_type_templates do
        mount Hapy::API::V1::ProgramTemplate::PlantTypeTemplate
      end

    end

  end
end