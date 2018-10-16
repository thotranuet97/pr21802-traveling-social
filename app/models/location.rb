class Location < ApplicationRecord
  belongs_to :user
  belongs_to :city, required: false
  has_many :reviews, dependent: :destroy
  has_many :images, as: :lr_image, dependent: :destroy

  extend FriendlyId
  friendly_id :name, use: :slugged

  geocoded_by :name
  after_validation :geocode, if: :name_changed?
end
