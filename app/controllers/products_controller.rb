class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @products = Product.all
    @categories = Category.all
    @category = @categories.first
    @product = Product.find_by(category: @category.id)

    @zx7 = Product.find_by(name: "ZX7 Speaker")
    @zx9 = Product.find_by(name: "ZX9 Speaker")
    @yx1 = Product.find_by(name: "YX1 Wireless Earphones")
  end

  def show
    @products = Product.all.order('RANDOM()').limit(3)
    @categories = Category.all
    @product = Product.find(params[:id])
    @pieces = Piece.where(product: @product)
    @carpro = Carpro.new

    @image = @product.image
  end
end
