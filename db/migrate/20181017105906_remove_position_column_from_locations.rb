class RemovePositionColumnFromLocations < ActiveRecord::Migration[5.2]
  def change
    remove_column :locations, :position, :string
  end
end
