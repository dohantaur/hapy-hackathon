module Hapy::API::V1::GreenHouses
  class PlantTemplateEntity < Grape::API

    before do
      doorkeeper_authorize!
    end


    get do
      present :data, PlantTemplate.all, with: Hapy::Entities::PlantTypeTemplateEntity
    end
  end
end