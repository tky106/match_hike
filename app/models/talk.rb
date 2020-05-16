class Talk < ApplicationRecord
  belongs_to :speaker, class_name: "User"
  belongs_to :post
end
