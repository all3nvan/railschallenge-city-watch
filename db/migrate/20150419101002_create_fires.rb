class CreateFires < ActiveRecord::Migration
  def change
    create_table :fires do |t|

      t.timestamps null: false
    end
  end
end
