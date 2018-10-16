class AddPositionToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :position, :string
  end
end
