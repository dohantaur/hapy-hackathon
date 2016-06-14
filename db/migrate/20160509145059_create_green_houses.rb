class CreateGreenHouses < ActiveRecord::Migration
  def change
    create_table :green_houses do |t|
      t.string :serial
      t.string :name
      t.string :description
      t.string :soil
      t.integer :actual_program, index: true
      t.string :picture_url
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
