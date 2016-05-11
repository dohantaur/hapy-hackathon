module Hapy::API::V1::GreenHouses
  class GreenHousePlants < Grape::API

    before do
      doorkeeper_authorize!
    end


    get do
      present :data, Plant.all, with: Hapy::Entities::GreenHousePlantEntity
    end
  end
end