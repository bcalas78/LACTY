class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :category

  validates :name, presence: true
  validates :composition, presence: true
  validates :image, presence: true

end
