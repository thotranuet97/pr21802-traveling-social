class CreateMicroPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :micro_posts do |t|
      t.references :location, foreign_key: true
      t.text :content

      t.timestamps
    end
  end
end
