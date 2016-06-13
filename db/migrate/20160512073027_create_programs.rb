class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|

      t.integer :temperature
      t.integer :humidity
      t.integer :light
      t.references :program_templates, index: true
      t.references :green_houses, index: true
      t.timestamps null: false
    end
  end
end
