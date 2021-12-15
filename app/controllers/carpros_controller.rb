class CarprosController < ApplicationController

  def destroy
    @carpro = Carpro.find(params[:id])
    @carpro.destroy
    redirect_to cart_path(current_user)
  end

end
