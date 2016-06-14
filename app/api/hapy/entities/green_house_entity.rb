module Hapy::Entities
  class GreenHouseEntity < Grape::Entity
    expose :id
    expose :serial
    expose :name
    expose :soil
    expose :description
    expose :picture_url
  end
end
