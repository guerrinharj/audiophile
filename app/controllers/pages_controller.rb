class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]
  include ApplicationHelper

  def home
  end

  def checkout
    @categories = Category.all
    @cart = current_user.carts.last
    @carpros = Carpro.where(cart: @cart)
    @order = Order.new
    @sum = carpros_sum(@carpros)
  end
end
