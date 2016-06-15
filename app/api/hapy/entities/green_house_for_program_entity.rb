module Hapy::Entities
  class GreenHouseForProgramEntity < Grape::Entity
    expose :id
    expose :soil
    expose :description
    expose :plants, using: Hapy::Entities::GreenHouseOnePlantForProgramEntity
  end
end
