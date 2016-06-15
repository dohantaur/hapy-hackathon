class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.datetime :plantationDate
      t.integer :temperature
      t.integer :humidity
      t.integer :light
      t.integer :moisture
      t.string :description
      t.string :picture_url
      t.references :green_house, foreign_key: true, index: true
      t.references :plant_template
      t.timestamps null: false
    end
  end
end
