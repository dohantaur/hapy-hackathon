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
  green_house
end
u.green_houses << green_houses
u.save