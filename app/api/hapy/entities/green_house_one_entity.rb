module Hapy::Entities
  class GreenHouseOneEntity < Grape::Entity
    expose :id
    expose :serial
    expose :name
    expose :soil
    expose :description
    expose :picture_url
    expose :actual_data
    expose :plants, using: Hapy::Entities::GreenHousePlantEntity
    expose :actual_program, using: Hapy::Entities::ProgramEntity
  end
end
