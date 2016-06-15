class Program < ActiveRecord::Base
  belongs_to :program_template
  belongs_to :green_house

  has_many :plants
end
