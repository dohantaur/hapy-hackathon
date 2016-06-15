module Hapy::Entities
  class ProgramEntity < Grape::Entity
    expose :id
    expose :humidity
    expose :temperature
    expose :light
    expose :created_at
    expose :updated_at
    expose :green_house_id
  end
end