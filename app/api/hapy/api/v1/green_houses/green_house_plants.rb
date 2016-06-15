module Hapy::API::V1::GreenHouses
  class GreenHousePlants < Grape::API

    before do
      doorkeeper_authorize!
    end


    get do
      present :data, current_green_house.plants, with: Hapy::Entities::GreenHousePlantEntity
    end

    params do
      requires :plant_template_id, type: Integer
      optional :name, type: String
      optional :description, type: String
      optional :picture_url, type: String
    end

    post do
      the_green_house = GreenHouse.find_by!(id: params[:id])
      pt = ::PlantTemplate.find_by!(id: params[:plant_template_id])
      Plant.create!({
              green_house: the_green_house,
              name: pt.name,
              plantationDate: DateTime.now,
              plant_template: pt,
              temperature: pt.temperature,
              humidity: pt.humidity,
              light: pt.light,
              description: pt.description,
              picture_url: pt.picture_url
          })
    end

  end
end