class AddPopularToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :porpular, :boolean, default: :false
  end
end
