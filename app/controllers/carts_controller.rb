class CartsController < ApplicationController
  
  before_action :set_cart, only: [:show, :edit, :update, :destroy]
  
  def index
    @carts = Cart.all
  end

  def new
    @cart =Cart.new
  end

  def show
  end

  def edit
  end

  def create
    @cart = Cart.new(params[:cart])
    if @cart.save
      redirect_to @cart, notic: "Cart was created."
    else
      render 'new'
    end
  end

  def update
    if @cart.update_attributes(params[:cart])
      redirect_to @cart, notice: "Cart was updated."
    else
      render "edit"
    end
  end

  def destroy
    @cart.destroy
    redirect_to carts_url
  end

  private
  def set_cart
    @cart = Cart.find(params[:id])
  end

end