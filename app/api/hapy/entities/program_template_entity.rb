module Hapy::Entities
  class ProgramTemplateEntity < Grape::Entity
    expose :id
    expose :name
    expose :humidity
    expose :light
    expose :moisture
    expose :temperature
    expose :description
  end
end