class GreenHouse < ActiveRecord::Base

  belongs_to :user

  has_many :plants
  has_one :program

end
