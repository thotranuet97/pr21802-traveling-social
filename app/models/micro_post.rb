class MicroPost < ApplicationRecord
  belongs_to :location
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
end
