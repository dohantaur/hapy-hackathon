require 'rest-client'
require 'json'
class GreenHouse < ActiveRecord::Base

  belongs_to :user

  has_many :plants
  belongs_to :program, foreign_key: :actual_program

  def actual_data
    begin
      response = RestClient.get "http://hapy-hackathon-broker.herokuapp.com/green_house/#{self.serial}"
      data = JSON.parse(response.body)
      puts data
      return data['data']['actual_data']
    rescue Exception => e
      return e
    end
  end

end
