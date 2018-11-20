class Image < ApplicationRecord
  belongs_to :lr_image, polymorphic: true, inverse_of: :images
  mount_uploader :image, ImageUploader
  scope :order_created_desc, -> {order created_at: :desc}
  belongs_to :user
end
