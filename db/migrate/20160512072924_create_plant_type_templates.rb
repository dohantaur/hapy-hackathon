class CreatePlantTypeTemplates < ActiveRecord::Migration
  def change
    create_table :plant_type_templates do |t|

      t.timestamps null: false
    end
  end
end
