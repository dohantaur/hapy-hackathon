u = User.new
u.email = 'dohant.aurelien@gmail.com'
u.password = 'password'
green_house =GreenHouse.new
green_house.serial='55a0c891-3be7-4305-b89b-7a953d37b807'
green_house.name = "Ma super serre de la mort qui tue ça mere!"
green_house.description = "Mes amis les plantes vertes"
u.green_houses << green_house
u.save

pt1 = ProgramTemplate.new
pt1.name = "programme d'Elsa"
pt1.description = "La jardinerie vu par Elsa"
pt1.moisture = 500
pt1.temperature = 20
pt1.humidity = 52
pt1.save

pt2 = ProgramTemplate.new
pt2.name = "Les jambons nous envahissent"
pt2.description = "Un géranium, 2 géranium, 3 géranium..."
pt2.moisture = 400
pt2.temperature = 16
pt2.humidity = 31
pt2.save

ptt1 =PlantTypeTemplate.new
ptt1.name = 'Rosaceae'
ptt1.program_template_id = pt1.id
ptt1.save

ptt2 =PlantTypeTemplate.new
ptt2.name = 'Solanacée'
ptt2.program_template_id = pt1.id
ptt2.save

ptt3 =PlantTypeTemplate.new
ptt3.name = 'Geraniaceae'
ptt3.program_template_id = pt2.id
ptt3.save


tomate = PlantTemplate.new
tomate.name = 'tomate'
tomate.description = "La tomate (Solanum lycopersicum L.) est une espèce de plantes herbacées de la famille des Solanacées, originaire du Nord-Ouest de l'Amérique du Sud1, largement cultivée pour son fruit. Le terme désigne aussi ce fruit charnu. La tomate se consomme comme un légume-fruit, crue ou cuite. Elle est devenue un élément incontournable de la gastronomie dans de nombreux pays, et tout particulièrement dans le bassin méditerranéen."
tomate.soil = 'champ'
tomate.temperature = 19
tomate.humidity = 60
tomate.light = 90
tomate.moisture = 700
tomate.picture_url = 'http://www.coloori.com/wp-content/uploads/2016/02/tomatedessin.jpg'
tomate.plant_type_template_id = ptt2.id
tomate.save


piment = PlantTemplate.new
piment.name = 'piment d\'espelette'
piment.description = "Le piment d'Espelette (Ezpeletako biperra en basque)(Capsicum annuum) est un produit agricole. Il s'agit d'un piment cultivé au Pays basque dans le département des Pyrénées-Atlantiques. Il tire son appellation d'origine de la commune d'Espelette."
piment.soil = 'terre'
piment.temperature = 22
piment.humidity = 50
piment.light = 90
piment.moisture = 400
piment.picture_url = 'http://stickeramoi.com/7060-7779-large/sticker-piment-rouge.jpg'
piment.plant_type_template_id = ptt2.id
piment.save

fraise = PlantTemplate.new
fraise.name = 'fraise'
fraise.description = "La fraise est le fruit des fraisiers (Fragaria), herbacées de la famille des Rosaceae. Ce fruit est botaniquement parlant un faux-fruit puisqu'il s'agit en réalité d'un réceptacle charnu sur lequel sont disposés régulièrement des akènes dans des alvéoles plus ou moins profondes, la fraise étant donc un polyakène"
fraise.soil = 'terre'
fraise.temperature = 17
fraise.humidity = 50
fraise.light = 90
fraise.moisture = 400
fraise.picture_url = 'http://www.coindeterre.org/medias/ecard/fraise.jpg'
fraise.plant_type_template_id = ptt1.id
fraise.save

geranium = PlantTemplate.new
geranium.name = 'géranium'
geranium.description = "Les espèces du genre Geranium sont des plantes herbacées annuelles ou pérennes et parfois des sous-arbrisseaux"
geranium.soil = 'terre'
geranium.temperature = 17
geranium.humidity = 50
geranium.light = 90
geranium.moisture = 400
geranium.picture_url = 'https://www.latoilescoute.net/IMG/auton3205.jpg'
geranium.save
geranium.plant_type_template_id = ptt3.id
geranium.save