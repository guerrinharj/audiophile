class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]

  def show
    @category = Category.find(params[:id])
    @products = Product.where(category: @category)
    @categories = Category.all
  end

end
