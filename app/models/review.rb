class Review < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :comments, as: :commentable, dependent: :destroy
  has_many :images, as: :lr_image, dependent: :destroy
end
