class ProgramTemplate < ActiveRecord::Base
  has_many :programs
  has_many :plant_type_templates
end
