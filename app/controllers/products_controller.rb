class ProductsController < ApplicationController
  skip_before_action :authenticate_user!

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def speakers
    @speakers = Product.where(category: "speakers")
  end

  def headphones
    @headphones = Product.where(category: "headphones")
  end

  def earphones
    @earphones = Product.where(category: "earphones")
  end
end
