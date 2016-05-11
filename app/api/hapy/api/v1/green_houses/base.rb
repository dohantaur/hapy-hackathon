module Hapy::API::V1::GreenHouses
  class Base < Grape::API

    before do
      doorkeeper_authorize!
    end


    get do
      present :data, GreenHouse.all, with: Hapy::Entities::GreenHouseEntity
    end

    route_param :id do
      resource :plants do
        mount Hapy::API::V1::GreenHouses::GreenHousePlants
      end

    end

  end
end