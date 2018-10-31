class MicroPost < ApplicationRecord
  belongs_to :location, optional: true
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  validates :content, presence: true, length: { maximum: 140 }

  scope :order_created_desc, -> {order created_at: :desc}

  mount_uploader :image, ImageUploader
end
