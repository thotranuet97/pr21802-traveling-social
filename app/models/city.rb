class City < ApplicationRecord
  belongs_to :user
  has_many :locations
  
  validates :name, presence: true
  mount_uploader :thumbnail, ImageUploader

  extend FriendlyId
  friendly_id :name, use: :slugged

  geocoded_by :name	  
  after_validation :geocode, if: :name_changed?

  def should_generate_new_friendly_id?
    name_changed? || super
  end
end
