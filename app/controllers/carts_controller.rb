class CartsController < ApplicationController

  def show
    @user = current_user
  end

  def create
    @cart = Cart.new(cart_params)
    redirect_to cart_path(current_user)
  end

  def update
  end

  private

  def cart_params
    params.require(:cart).permit(:user)
  end

end
