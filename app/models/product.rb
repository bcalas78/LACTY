class Product < ApplicationRecord
  has_many :reviews
  belongs_to :category

  validates :name, presence: true
  # validates :composition, presence: true

end
