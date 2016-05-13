module Hapy::Entities
  class GreenHouseOnePlantEntity < Grape::Entity
    expose :id
    expose :name
    expose :description
    expose :picture_url
  end
end
