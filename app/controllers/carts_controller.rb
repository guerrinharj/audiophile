class CartsController < ApplicationController
  include ApplicationHelper

  def show
    @categories = Category.all
    @user = current_user
    @cart = @user.carts.last
    @carpros = @cart.carpros
    @sum = carpros_sum(@carpros)
  end

  def create
  end

  def update
  end

  private

  def cart_params
    params.require(:cart).permit(:user)
  end
end
