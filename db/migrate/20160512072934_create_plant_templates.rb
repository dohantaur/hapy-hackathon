class CreatePlantTemplates < ActiveRecord::Migration
  def change
    create_table :plant_templates do |t|

      t.string :name
      t.string :soil
      t.integer :temperature
      t.integer :humidity
      t.integer :light
      t.integer :moisture
      t.string :description
      t.string :picture_url
      t.references :plant_type_template
      t.timestamps null: false
    end
  end
end
