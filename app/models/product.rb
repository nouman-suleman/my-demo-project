class Product < ApplicationRecord

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true

  belongs_to  :user
  belongs_to  :order, optional: true
  belongs_to  :cart, optional: true
  has_many    :comments, dependent: :destroy
  has_many    :line_items
  has_many_attached :images

end
