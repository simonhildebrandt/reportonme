class Addvaluetodatapoint < ActiveRecord::Migration
  def change
    add_column :datapoints, :value, :integer
  end
end
