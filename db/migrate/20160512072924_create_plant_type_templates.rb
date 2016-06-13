class CreatePlantTypeTemplates < ActiveRecord::Migration
  def change
    create_table :plant_type_templates do |t|

      t.string :name
      t.string :soil
      t.string :description
      t.timestamps null: false
      t.references :program_template
    end
  end
end
