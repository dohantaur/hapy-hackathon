require 'rest-client'
module Hapy::API::V1::GreenHouses
  class GreenHousesActions < Grape::API

    before do
      doorkeeper_authorize!
    end

    params do
      requires :action_name
      requires :action_value
    end
    post do
      green_house = GreenHouse.find_by!(id: params[:id])
      RestClient.get "http://hapy-hackathon-broker.herokuapp.com/green_house/#{green_house.serial}/action", {:params => {name: params[:action_name], value: params[:action_value]}}
      status :no_content
    end

  end
end