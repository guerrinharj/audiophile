class Product < ApplicationRecord
  has_many :pieces
  belongs_to :category
end
