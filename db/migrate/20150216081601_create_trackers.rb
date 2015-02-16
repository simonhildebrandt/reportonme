class CreateTrackers < ActiveRecord::Migration
  def change
    create_table :trackers do |t|
      t.references :user, index: true

      t.timestamps null: false
    end
    add_foreign_key :trackers, :users
  end
end
