class PostsUser < ApplicationRecord
  # belongs_to :contributor, class_name: "Post", foreign_key: contributor_id
  # belongs_to :applicant, class_name: "User", foreign_key: applicant_id
  belongs_to :applicant, class_name: "User", dependent: :destroy
  belongs_to :post, dependent: :destroy
  accepts_nested_attributes_for :post, allow_destroy: true
end
