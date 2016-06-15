# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

##init all templates
program_templates = (1..5).map do |index|
  program_template = ProgramTemplate.new
  program_template.name = "program template. #{index}"
  program_template.plant_type_templates << (1..3).map do |index|
    plant_type_template = PlantTypeTemplate.new
    plant_type_template.name = "plant type template. #{index}"
    plant_type_template.plant_templates << (1..2).map do |index|
      plant_template = PlantTemplate.new
      plant_template.name = "plant template. #{index}"
      plant_template
    end
    plant_type_template
  end
  program_template.save
end
##init user then greenhouses then plants
u = User.new
u.email = 'dohant.aurelien@gmail.com'
u.password = 'password'
green_houses = (1..10).map do |index|
  green_house = GreenHouse.new
  green_house.serial='55a0c891-3be7-4305-b89b-7a953d37b807'
  green_house.name = "green house #{index}"
  green_house.description = "green house desc. #{index}"
  plants = (1..3).map do |index|
    plant = Plant.new
    plant.name = "plant #{index}"
    plant.description = "plant desc. #{index}"
    plant.plant_template_id = rand(10)+1
    plant
  end
  green_house.plants << plants
  green_house
end
u.green_houses << green_houses
u.save

u.green_houses.each do |greenhouse|
  program = Program.new(  humidity: rand(90),
                          temperature: rand(30),
                          light: rand(1000),
                          moisture: rand(900),
                          green_house_id: greenhouse.id)
  program.save
  greenhouse.actual_program = program.id
  greenhouse.save
end
