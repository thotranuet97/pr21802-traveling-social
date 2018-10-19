class Image < ApplicationRecord
  belongs_to :lr_image, polymorphic: true, inverse_of: :images
  mount_uploader :image, ImageUploader
end
