class MicroPost < ApplicationRecord
  include Nested

  belongs_to :location, optional: true
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  validates :content, presence: true, length: { maximum: 140 }
  acts_as_votable

  scope :order_created_desc, -> {order created_at: :desc}
  scope :all_status, -> (user) do
    where(user_id: user.all_following.pluck(:id).push(user.id)).order_created_desc
  end

  mount_uploader :image, ImageUploader
end
