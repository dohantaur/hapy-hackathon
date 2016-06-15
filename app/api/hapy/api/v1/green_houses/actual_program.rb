require 'rest-client'
module Hapy::API::V1::GreenHouses
  class ActualProgram < Grape::API

    before do
      doorkeeper_authorize!
    end


    get do
      present :data, current_green_house.program, with: Hapy::Entities::ProgramEntity
    end

    params do
      requires :humidity, type: Integer
      requires :temperature, type: Integer
      requires :light, type: Integer
      optional :program_template_id, type: Integer
    end

    post do
      program = Program.new({
                        temperature: params[:temperature],
                        humidity: params[:humidity],
                        green_house: GreenHouse.find_by!(id: params[:id]),
                        program_template: ProgramTemplate.find_by!(id: params[:program_template_id])
                    })
      program.save
      puts '!!!!!!!!'
      puts program.id
      puts '!!!!!!!!'
      GreenHouse.update(params[:id], :actual_program => program.id)
      h = {
          t: program.temperature.blank? ? 0 : program.temperature,
          m: program.moisture.blank? ? 0 : program.moisture,
          l: program.light.blank? ? 0 : program.light,
          h: program.humidity.blank? ? 0 : program.humidity
      }
      RestClient.post "http://hapy-hackathon-broker.herokuapp.com/green_house/#{current_green_house.serial}/program", h.to_json, :content_type => 'application/json'
      present :data, program, with: Hapy::Entities::ProgramEntity
    end

  end
end