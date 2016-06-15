class CreateProgramTemplates < ActiveRecord::Migration
  def change
    create_table :program_templates do |t|

      t.string :name
      t.integer :humidity
      t.integer :temperature
      t.integer :light
      t.integer :moisture
      t.string :description
      t.timestamps null: false
    end
  end
end
