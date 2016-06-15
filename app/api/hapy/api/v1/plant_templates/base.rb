module Hapy::API::V1::PlantTemplates
  class Base < Grape::API

    before do
      doorkeeper_authorize!
    end

    get do
      present :data, PlantTemplate.all, with: Hapy::Entities::PlantTemplateEntity
    end

  end
end