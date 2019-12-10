class Product < ApplicationRecord

  validates :name, presence: true,
                    length: { minimum: 5 }
  validates :price, presence: true
  validates :category, presence: true

  belongs_to    :user

  has_many      :comments

end
