class AddImageCacheToMicroPosts < ActiveRecord::Migration[5.2]
  def change
    add_column :micro_posts, :image_cache, :string
  end
end
