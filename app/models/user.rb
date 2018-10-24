class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :locations
  has_many :cities
  has_many :reviews, dependent: :destroy
  has_many :micro_posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :events, dependent: :destroy

  enum gender: {male: 1, female: 0, other: 2}
  mount_uploader :thumbnail, ImageUploader
  mount_uploader :cover, ImageUploader
end
