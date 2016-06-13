module Hapy::API::V1::GreenHouses
  class PlantTypeTemplate < Grape::API

    before do
      doorkeeper_authorize!
    end

    get do
      present :data, PlantTypeTemplate.all, with: Hapy::Entities::ProgramTemplate
    end
  end
end