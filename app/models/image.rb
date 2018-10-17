class Image < ApplicationRecord
  belongs_to :lr_image, polymorphic: true
  mount_uploader :image, ImageUploader
end
