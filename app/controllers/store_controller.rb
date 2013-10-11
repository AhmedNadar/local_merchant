class StoreController < ApplicationController

  # before_filter :require_login, :only => @products
  
  def index
    @products = Product.all
  end
end
