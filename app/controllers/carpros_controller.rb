class CarprosController < ApplicationController

  def create_carpro(product, cart)
    @carpro = Carpro.new(carpro_params)
    @carpro.product = product
    @carpro.cart = cart
    @carpro.save
    redirect_to cart_path(cart)
  end

  def create
    @product = Product.find(params[:product_id])

    if current_user.carts
      create_carpro(@product, current_user.carts.last)
    else
      @cart = Cart.new
      @cart.user = current_user
      @cart.save
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
