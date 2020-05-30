class Post < ApplicationRecord
  has_many :posts_users, dependent: :destroy
  has_many :talks, dependent: :destroy
  has_many :applicants, class_name: "User", through: :posts_users
  belongs_to :contributor, class_name: "User"
  accepts_nested_attributes_for :posts_users, allow_destroy: true
end
