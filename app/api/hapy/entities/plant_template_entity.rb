module Hapy::Entities
  class PlantTemplateEntity < Grape::Entity
    expose :id
    expose :name
    expose :description
    expose :temperature
    expose :humidity
    expose :soil
  end
end