class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @products = Product.all
    @product = Product.where(category: "headphones").first
  end

  def show
    @product = Product.find(params[:id])
    @pieces = Piece.where(product: @product)
  end

  def create_carpro(cart, product, user)
    @carpro = Carpro.new
    @carpro.product = product
    @carpro.cart = cart.first
    @carpro.save
  end

  def update
    @product = Product.find(params[:id])
    @user = current_user

    if @user.carts
      @cart = @user.carts
      create_carpro(@cart, @product, @user)
    else
      @cart = Cart.new
      @cart.user = @user
      @cart.save
      create_carpro(@cart, @product, @user)
    end
   redirect_to cart_path(@user)
  end

  def destroy
    raise
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
