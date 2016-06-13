module Hapy::Entities
  class GreenHouseOnePlantEntity < Grape::Entity
    expose :id
    expose :name
    expose :plantationDate
    expose :soil
    expose :temperature
    expose :humidity
    expose :description
    expose :picture_url
  end
end
