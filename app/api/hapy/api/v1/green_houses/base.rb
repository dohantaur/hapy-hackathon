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

      params do
        requires :id, type: Integer
        requires :plant_template_id, type: Integer
        requires :name, type: String
        optional :description, type: String
        optional :picture_url, type: String
      end

      post do
        the_green_house = GreenHouse.find_by!(id: declared(params).id)
        Plant.create!({
                            green_house: the_green_house,
                            name: params[:name],
                            plantationDate: DateTime.now,
                            plant_template: PlantTemplate.find_by!(id: params[:plant_template_id]),
                            temperature: PlantTemplate.find_by!(id: params[:plant_template_id]).temperature,
                            humidity: PlantTemplate.find_by!(id: params[:plant_template_id]).humidity,
                            description: params[:description],
                            picture_url: params[:picture_url]
                       })
      end

      resource :plants do
        mount Hapy::API::V1::GreenHouses::GreenHousePlants
      end

    end

  end
end