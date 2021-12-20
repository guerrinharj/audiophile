class OrdersController < ApplicationController
  def show
    @categories = Category.all
    @user = current_user
    @order = Order.find(params[:id])
    @last_cart = Cart.find(@order.cart_id)
    @order.confirmed = true
    if @order.save
      @cart = Cart.new
      @cart.user = @user
      @cart.save
    end
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
    params.require(:order).permit(:name, :address, :email, :phone_number, :zipcode, :city, :country, :emoney_number, :emoney_pin)
  end
end
