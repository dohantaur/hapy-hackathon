class CreatePlantTemplates < ActiveRecord::Migration
  def change
    create_table :plant_templates do |t|

      t.string :name
      t.string :soil
      t.string :description
      t.references :plant_type_template
      t.timestamps null: false
    end
  end
end
