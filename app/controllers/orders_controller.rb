class OrdersController < ApplicationController
  def show
    @user = current_user
    @order = Order.find(params[:id])
    @cart = Cart.find(@order.cart_id)
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user
    @cart = params[:cart_id]
    @order.cart_id = @cart

    if @order.save
      redirect_to cart_order_path(@cart, @order)
    else
      flash.alert = "Fields can't be blank"
    end
  end

  private

  def order_params
    params.require(:order).permit(:name, :address)
  end
end
