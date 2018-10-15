class Image < ApplicationRecord
  belongs_to :lr_image, polymorphic: true
end
