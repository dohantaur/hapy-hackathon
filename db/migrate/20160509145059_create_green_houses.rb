class CreateGreenHouses < ActiveRecord::Migration
  def change
    create_table :green_houses do |t|
      t.string :name
      t.references :user, index: true
      t.timestamps null: false
    end
  end
end
