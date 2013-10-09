class OrdersController < ApplicationController
  
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def show
  end

  def edit
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order, notic: "order was created."
    else
      render :new
    end
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: "order was updated."
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_url
  end

  private
  def set_order
    @order = order.find(params[:id])
  end

  def order_params
    params.require(:order_item).permit(:buyer_id, :status)
  end

end