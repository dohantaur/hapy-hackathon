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
      Plant.create!({
              green_house: the_green_house,
              name: params[:name],
              plantationDate: DateTime.now,
              plant_template: PlantTemplate.find_by!(id: params[:plant_template_id]),
              temperature: PlantTemplate.find_by!(id: params[:plant_template_id]).temperature,
              humidity: PlantTemplate.find_by!(id: params[:plant_template_id]).humidity,
              light: PlantTemplate.find_by!(id: params[:plant_template_id]).light,
              description: params[:description],
              picture_url: params[:picture_url]
          })
    end

  end
end