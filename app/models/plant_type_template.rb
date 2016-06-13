class PlantTypeTemplate < ActiveRecord::Base
  belongs_to :program_template
  has_many :plant_templates
end
