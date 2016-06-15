module Hapy::API::V1::ProgramTemplates
  class Base < Grape::API

    before do
      doorkeeper_authorize!
    end

    params do
      optional :green_house_id
    end
    get do
      if params[:green_house_id].blank?
        present :data, ProgramTemplate.all, with: Hapy::Entities::ProgramTemplateEntity
      else
        plant_template_ids = GreenHouse.find(params[:green_house_id]).plants.pluck(:plant_template_id)
        type_temps = PlantTypeTemplate.where(id: PlantTemplate.where(id: plant_template_ids)).pluck(:program_template_id)
        concern_programs = ProgramTemplate.where(id: type_temps)

        present :data, concern_programs, with: Hapy::Entities::ProgramTemplateEntity
      end
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