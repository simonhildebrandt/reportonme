class Addnametotracker < ActiveRecord::Migration
  def change
    add_column :trackers, :name, :string
  end
end
