module Hapy::Entities
  class GreenHouseOnePlantEntity < Grape::Entity
    expose :id
    expose :name
    expose :plantationDate
    expose :soil
    expose :humidity
    expose :light
    expose :moisture
    expose :temperature
    expose :description
    expose :picture_url
  end
end
