module Hapy::Entities
  class OnePlantTypeTemplateEntity < Grape::Entity
    expose :id
    expose :name
    expose :soil
    expose :description
    expose :plant_templates, using: Hapy::Entities::PlantTemplateEntity
  end
end
