class ApplicationController < ActionController::Base
  before_action :authenticate_user!, :nav_categories


  def nav_categories
    @categories = Category.all
  end
end
