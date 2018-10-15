class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :avatar
      t.string :name
      t.string :phone_number
      t.string :job
      t.text :description

      t.timestamps
    end
  end
end
