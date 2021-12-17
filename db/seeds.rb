# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

Category.destroy_all
Cart.destroy_all
Product.destroy_all
Piece.destroy_all

headphones = Category.new(name: "headphones")
headphones.save!
speakers = Category.new(name: "speakers")
speakers.save!
earphones = Category.new(name: "earphones")
earphones.save!

puts "Categories seeded!"

categories = Category.all

json_file = JSON.parse(File.read('db/dataseed.json'))

json_file.each do |element|
  product = Product.new
  product.slug = element["slug"]
  product.name = element["name"]
  product.price = element["price"]
  product.description = element["description"]
  product.features = element["features"]
  product.image = element["image"]

  categories.each do |category|
    product.category_id = category.id if element["category"] == category.name
  end

  product.save!

  puts "#{product.name} seeded!"

  element["includes"].each do |inc|
    piece = Piece.new
    piece.name = inc["item"]
    piece.quantity = inc["quantity"]
    piece.product_id = product.id
    piece.save!
    puts "#{piece.name} seeded!"
  end
end
