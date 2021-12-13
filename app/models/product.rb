class Product < ApplicationRecord
  has_many :pieces
  has_many :cart_products
end
