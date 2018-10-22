class AddAdressToCities < ActiveRecord::Migration[5.2]
  def change
    add_column :cities, :address, :text
  end
end
