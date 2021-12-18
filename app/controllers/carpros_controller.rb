class CarprosController < ApplicationController

  def create_cart
    @cart = Cart.new
    @cart.user = current_user
    @cart.save
    @cart
  end

  def create_carpro(product, cart)
    @carpro = Carpro.new(carpro_params)
    @carpro.product = product
    @carpro.cart = cart
    @carpro.save
    redirect_to cart_path(cart)
  end

  def create
    @product = Product.find(params[:product_id])
    @carts = current_user.carts

    if @carts.empty?
      @cart = create_cart
      create_carpro(@product, @cart)
    end

    if @carts.last.orders.empty? || @carts.last.orders.last.confirmed == false
      create_carpro(@product, current_user.carts.last)
    else
      @cart = create_cart
      create_carpro(@product, @cart)
    end

  end

  def destroy
    @carpro = Carpro.find(params[:id])
    @carpro.destroy
    redirect_to cart_path(current_user)
  end

  def carpro_params
    params.require(:carpro).permit(:quantity, :product_id)
  end

end
