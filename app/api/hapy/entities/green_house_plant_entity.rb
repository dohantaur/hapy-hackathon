module Hapy::Entities
  class GreenHousePlantEntity < Grape::Entity
    expose :id
    expose :name
    expose :plantationDate
    expose :soil
    expose :humidity
    expose :light
    expose :moisture
    expose :temperature
  end
end
