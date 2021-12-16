class Order < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
  validates :email, presence: true
  validates :phone_number, presence: true
  validates :zipcode, presence: true
  validates :city, presence: true
  validates :country, presence: true
  validates :emoney_number, presence: true
  validates :emoney_pin, presence: true
end
