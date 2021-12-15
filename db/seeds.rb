# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

Cart.destroy_all
Product.destroy_all
Piece.destroy_all

json_file = JSON.parse(File.read('db/dataseed.json'))

json_file.each do |element|
  product = Product.new
  product.slug = element["slug"]
  product.name = element["name"]
  product.category = element["category"]
  product.price = element["price"]
  product.description = element["description"]
  product.features = element["features"]
  product.image = element["image"]
  product.save!

  element["includes"].each do |inc|
    piece = Piece.new
    piece.name = inc["item"]
    piece.quantity = inc["quantity"]
    piece.product_id = product.id
    piece.save!
  end
end
