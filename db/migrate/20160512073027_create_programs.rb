class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|

      t.integer :temperature
      t.integer :humidity
      t.integer :light
      t.integer :moisture
      t.references :program_template, index: true
      t.references :green_house, foreign_key: true, index: true
      t.timestamps null: false
    end
  end
end
