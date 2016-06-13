class CreatePlants < ActiveRecord::Migration
  def change
    create_table :plants do |t|
      t.string :name
      t.string :description
      t.datetime :plantationDate
      t.string :picture_url
      t.references :green_house, foreign_key: true, index: true
      t.references :plant_template
      t.timestamps null: false
    end
  end
end
