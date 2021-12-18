# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'json'
require 'open-uri'

User.destroy_all
Category.destroy_all
Cart.destroy_all
Product.destroy_all
Piece.destroy_all

headphones = Category.new(name: "headphones")
headphones.image_url << "https://res.cloudinary.com/db7q8jblt/image/upload/v1639684179/audiophile/category-headphones/desktop/image-xx99-mark-two_ajzyis.jpg" << "https://res.cloudinary.com/db7q8jblt/image/upload/v1639684179/audiophile/category-headphones/desktop/image-xx99-mark-one_hcua7d.jpg" << "https://res.cloudinary.com/db7q8jblt/image/upload/v1639684179/audiophile/category-headphones/desktop/image-xx59_zfe192.jpg"
headphones.save!
speakers = Category.new(name: "speakers")
speakers.image_url << "https://res.cloudinary.com/db7q8jblt/image/upload/v1639684180/audiophile/category-speakers/desktop/image-zx9_k7vgrh.jpg" << "https://res.cloudinary.com/db7q8jblt/image/upload/v1639684180/audiophile/category-speakers/desktop/image-zx7_jr5cl5.jpg"
speakers.save!
earphones = Category.new(name: "earphones")
earphones.image_url << "https://res.cloudinary.com/db7q8jblt/image/upload/v1639684179/audiophile/category-earphones/desktop/image-yx1-earphones_pnfpos.jpg" << "https://res.cloudinary.com/db7q8jblt/image/upload/v1639684179/audiophile/category-earphones/mobile/image-yx1-earphones_at9v6s.jpg"
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
  product.image = element["image"]["desktop"]
  product.galery_array = [element["gallery"]["first"]["desktop"], element["gallery"]["second"]["desktop"], element["gallery"]["third"]["desktop"]]

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
