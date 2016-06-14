module Hapy::API::V1::Programs
  class Base < Grape::API

    before do
      doorkeeper_authorize!
    end


    get do
      present :data, Program.all, with: Hapy::Entities::ProgramEntity
    end

    route_param :id do
      params do
        requires :id, type: Integer
      end
      get do
        program = Program.find_by!(id: declared(params).id)
        present :data, program, with: Hapy::Entities::ProgramEntity
      end
    end

  end
end