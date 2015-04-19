class CreatePolice < ActiveRecord::Migration
  def change
    create_table :police do |t|

      t.timestamps null: false
    end
  end
end
