module Hapy::Entities
  class PlantTemplateEntity < Grape::Entity
    expose :id
    expose :name
    expose :description
    expose :humidity
    expose :light
    expose :moisture
    expose :temperature
    expose :soil
  end
end