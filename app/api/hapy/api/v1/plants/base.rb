module Hapy::API::V1::Plants
  class Base < Grape::API

    before do
      doorkeeper_authorize!
    end


    get do
      present :data, Plant.all, with: Hapy::Entities::GreenHousePlantEntity
    end

    route_param :id do
      params do
        requires :id, type: Integer
      end
      get do
        plant = Plant.find_by!(id: declared(params).id)
        present :data, plant, with: Hapy::Entities::GreenHouseOnePlantEntity
      end

    end

  end
end