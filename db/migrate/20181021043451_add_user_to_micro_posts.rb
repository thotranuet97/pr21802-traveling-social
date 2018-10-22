class AddUserToMicroPosts < ActiveRecord::Migration[5.2]
  def change
    add_reference :micro_posts, :user, foreign_key: true
  end
end
