class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts
  has_many :recruiting_posts, class_name: "Post", foreign_key: "user_id"
  has_many :applied_posts, class_name: "Post", foreign_key: "applicant_id"
  has_many :recruited_posts, class_name: "Post", foreign_key: "user_id"
end
