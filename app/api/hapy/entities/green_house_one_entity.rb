module Hapy::Entities
  class GreenHouseOneEntity < Grape::Entity
    expose :id
    expose :name
    expose :soil
    expose :description
    expose :picture_url
    expose :plants, using: Hapy::Entities::GreenHouseOnePlantEntity
  end
end
