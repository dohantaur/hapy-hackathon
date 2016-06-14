module Hapy::API::V1::GreenHouses
  class Base < Grape::API

    before do
      doorkeeper_authorize!
    end


    get do
      present :data, current_user.green_houses, with: Hapy::Entities::GreenHouseEntity
    end

    route_param :id do

      params do
        requires :id, type: Integer
      end

      get do
        green_house = GreenHouse.find_by!(id: declared(params).id)
        present :data, green_house, with: Hapy::Entities::GreenHouseOneEntity
      end


      resource :plants do
        mount Hapy::API::V1::GreenHouses::GreenHousePlants
      end

      resource :actual_program do
        mount Hapy::API::V1::GreenHouses::ActualProgram
      end

      resource :actions do
        mount Hapy::API::V1::GreenHouses::GreenHousesActions
      end

    end

  end
end