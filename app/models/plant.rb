class Plant < ActiveRecord::Base

  belongs_to :green_house
  belongs_to :plant_template

  delegate :soil, to: :plant_template
end
