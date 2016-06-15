module Hapy::Entities
  class OneProgramTemplateEntity < Grape::Entity
    expose :id
    expose :name
    expose :humidity
    expose :light
    expose :moisture
    expose :temperature
    expose :description
    expose :plant_type_templates, using: Hapy::Entities::PlantTypeTemplateEntity
  end
end