class AddAdressToLocations < ActiveRecord::Migration[5.2]
  def change
    add_column :locations, :address, :text
  end
end
