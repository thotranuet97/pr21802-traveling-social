class Comment < ApplicationRecord
  include Nested

  belongs_to :commentable, polymorphic: true
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
  validates :content, presence: true
  scope :order_created_desc, -> {order created_at: :desc}
end
