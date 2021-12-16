class CartsController < ApplicationController
  include ApplicationHelper

  def show
    @user = current_user
    @cart = @user.carts.first
    @carpros = Carpro.where(cart: @cart)

    sum = carpros_sum(@carpros)

    raise

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
