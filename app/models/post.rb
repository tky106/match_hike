class Post < ApplicationRecord
  has_many :posts_users
  
  has_many :applicants, class_name: "User", through: :posts_users
  belongs_to :contributor, class_name: "User"
  accepts_nested_attributes_for :posts_users, allow_destroy: true
  # has_many :user_applicants, class_name: "PostsUser", foreign_key: :applicant_id
  # has_many :applicants, through: :user_applicants
end
