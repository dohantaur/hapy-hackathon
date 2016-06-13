module Hapy::Entities
  class PlantTypeTemplateEntity < Grape::Entity
    expose :id
    expose :name
    expose :soil
    expose :description
  end
end
