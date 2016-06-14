module Hapy::Entities
  class GreenHousePlantEntity < Grape::Entity
    expose :id
    expose :name
    expose :plantationDate
    expose :soil
    expose :temperature
    expose :humidity
    expose :picture_url
  end
end
