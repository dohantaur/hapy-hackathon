module Hapy::Entities
  class ProgramEntity < Grape::Entity
    expose :id
    expose :humidity
    expose :light
    expose :moisture
    expose :temperature
    expose :green_house, using: Hapy::Entities::GreenHouseForProgramEntity
    expose :created_at
    expose :updated_at
    expose :green_house_id
  end
end