class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product
  validates :comment, length: { minimum: 10 }
end
