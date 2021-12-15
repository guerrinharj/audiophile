class OrdersController < ApplicationController
  def show
    @user = current_user
    @order = Order.find(params[:id])
  end

  def create
    @user = current_user

  end
end
