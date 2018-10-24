class AddInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :thumbnail, :string
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :phone, :string
    add_column :users, :birtday, :date
    add_column :users, :gender, :integer
    add_column :users, :city, :string
    add_column :users, :about, :text
  end
end
