class Product < ApplicationRecord
  has_many :pieces, dependent: :destroy
  belongs_to :category
end
