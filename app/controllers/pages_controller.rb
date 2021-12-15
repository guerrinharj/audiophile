class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def checkout

    @cart = current_user.carts.first
    @carpros = Carpro.where(cart: @cart)
    @order = Order.new
    @order
  end

end
