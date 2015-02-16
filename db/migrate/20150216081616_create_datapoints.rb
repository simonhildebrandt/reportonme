class CreateDatapoints < ActiveRecord::Migration
  def change
    create_table :datapoints do |t|
      t.references :tracker, index: true

      t.timestamps null: false
    end
    add_foreign_key :datapoints, :trackers
  end
end
