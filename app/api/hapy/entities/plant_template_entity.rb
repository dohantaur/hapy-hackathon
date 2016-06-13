module Hapy::Entities
  class PlantTemplateEntity < Grape::Entity
    expose :id
    expose :name
    expose :description
  end
end