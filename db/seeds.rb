# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u = User.new
u.email = 'dohant.aurelien@gmail.com'
u.password = 'password'
green_houses = (1..10).map do |index|
  green_house = GreenHouse.new
  green_house.name = "green house #{index}"
  green_house.description = "green house desc. #{index}"
  plants = (1..3).map do |index|
    plant = Plant.new
    plant.name = "plant #{index}"
    plant.description = "plant desc. #{index}"
    plant
  end
  green_house.plants << plants
  green_house
end
u.green_houses << green_houses
u.save