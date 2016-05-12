class CreateProgramTemplates < ActiveRecord::Migration
  def change
    create_table :program_templates do |t|

      t.timestamps null: false
    end
  end
end
