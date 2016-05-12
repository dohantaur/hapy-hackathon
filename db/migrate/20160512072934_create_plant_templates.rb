class CreatePlantTemplates < ActiveRecord::Migration
  def change
    create_table :plant_templates do |t|

      t.references :plant_type_templates
      t.timestamps null: false
    end
  end
end
