class Post < ApplicationRecord
  belongs_to :contributor, class_name: "User", optional: true
  belongs_to :applicant, class_name: "User", optional: true
end
