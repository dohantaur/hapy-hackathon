module Hapy::API::V1::GreenHouses
  class ActualProgram < Grape::API

    before do
      doorkeeper_authorize!
    end


    get do
      present :data, Program.all, with: Hapy::Entities::ProgramEntity
    end

    params do
      requires :humidity, type: Integer
      requires :temperature, type: Integer
      requires :light, type: Integer
      optional :program_template_id, type: Integer
    end

    post do
      Program.create!({
                        temperature: params[:temperature],
                        humidity: params[:humidity],
                        green_house: GreenHouse.find_by!(id: params[:id]),
                        program_template: ProgramTemplate.find_by(id: params[:program_template_id])
                    })
    end

  end
end