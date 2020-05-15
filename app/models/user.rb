class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts_users
  has_many :posts, through: :posts_users
  accepts_nested_attributes_for :posts_users, allow_destroy: true
  # has_many :post_contributors, class_name: "PostsUser", foreign_key: :contributor_id
  # has_many :contributors, through: :post_contributors

  # has_many :recruiting_posts, class_name: "Post", through: :posts_users, foreign_key: "contributor_id"
  # has_many :applied_posts, class_name: "Post", through: :posts_users, foreign_key: "applicant_id"
  # has_many :recruited_posts, class_name: "Post", through: :posts_users, foreign_key: "contributor_id"
end
