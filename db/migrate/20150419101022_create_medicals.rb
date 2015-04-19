class CreateMedicals < ActiveRecord::Migration
  def change
    create_table :medicals do |t|

      t.timestamps null: false
    end
  end
end
