class Product < ApplicationRecord
  has_many :product_pieces
  has_many :cart_products
end
