module Hapy::Entities
  class GreenHouseEntity < Grape::Entity
    expose :id
    expose :name
    expose :soil
    expose :description
  end
end
