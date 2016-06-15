module Hapy::API::V1::PlantTemplates
  class Base < Grape::API

    before do
      doorkeeper_authorize!
    end

    params do
      optional :name, type: String
    end
    get do
      puts params[:name]
      if params[:name].blank?
        present :data, PlantTemplate.all, with: Hapy::Entities::PlantTemplateEntity
      else
        present :data, PlantTemplate.where('name LIKE ?', "%#{params[:name]}%"), with: Hapy::Entities::PlantTemplateEntity
      end
    end

  end
end