class Cart < ApplicationRecord
  belongs_to :user
  has_many :products
  has_many :carpros, dependent: :destroy
  has_many :orders, dependent: :destroy
end
