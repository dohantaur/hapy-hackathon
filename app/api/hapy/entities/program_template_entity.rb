module Hapy::Entities
  class ProgramTemplateEntity < Grape::Entity
    expose :id
    expose :name
    expose :humidity
    expose :temperature
    expose :light
    expose :description
  end
end