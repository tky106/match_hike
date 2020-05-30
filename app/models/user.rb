class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :talks
  has_many :posts_users
  has_many :posts, through: :posts_users
  accepts_nested_attributes_for :posts_users, allow_destroy: true
  mount_uploader :image, ImageUploader
end
