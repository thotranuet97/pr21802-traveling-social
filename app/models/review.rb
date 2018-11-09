class Review < ApplicationRecord
  belongs_to :user
  belongs_to :location, required: false, inverse_of: :reviews
  has_many :comments, as: :commentable, dependent: :destroy
  
  has_many :images, as: :lr_image, dependent: :destroy, inverse_of: :lr_image
  accepts_nested_attributes_for :images, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  mount_uploader :thumbnail, ImageUploader

  acts_as_punchable

  extend FriendlyId
  friendly_id :name, use: :slugged
  
  def should_generate_new_friendly_id?
    name_changed? || super
  end
end
