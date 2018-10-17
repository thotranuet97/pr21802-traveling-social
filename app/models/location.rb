class Location < ApplicationRecord
  belongs_to :user
  belongs_to :city, required: false
  has_many :reviews, dependent: :destroy
  has_many :images, as: :lr_image, dependent: :destroy
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true

  mount_uploader :thumbnail, ImageUploader

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  def should_generate_new_friendly_id?
    name_changed? || super
  end

  geocoded_by :name
  after_validation :geocode, if: :name_changed?
end
