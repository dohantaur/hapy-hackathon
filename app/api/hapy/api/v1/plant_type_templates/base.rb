module Hapy::API::V1::PlantTypeTemplates
  class Base < Grape::API

    before do
      doorkeeper_authorize!
    end


    get do
      present :data, PlantTypeTemplate.all, with: Hapy::Entities::PlantTypeTemplateEntity
    end

    route_param :id do
      params do
        requires :id, type: Integer
      end
      get do
        plant_type_template = PlantTypeTemplate.find_by!(id: declared(params).id)
        present :data, plant_type_template, with: Hapy::Entities::OnePlantTypeTemplateEntity
      end

      resource :plant_templates do
        mount PlantTemplate
      end

    end

  end
end