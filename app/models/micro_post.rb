class MicroPost < ApplicationRecord
  belongs_to :location, optional: true
  belongs_to :user
  has_many :comments, as: :commentable, dependent: :destroy
end
