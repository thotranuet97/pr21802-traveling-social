class Location < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :reviews, dependent: :destroy
  has_many :images, as: :lr_image, dependent: :destroy
end
