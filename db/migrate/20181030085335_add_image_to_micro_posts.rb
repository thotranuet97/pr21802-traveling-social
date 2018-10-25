class AddImageToMicroPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :micro_posts, :image, :string
  end
end
