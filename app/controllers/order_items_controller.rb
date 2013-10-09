class OrderItemsController < ApplicationController
  
  before_action :set_item, only: [:show, :new, :update, :destroy]
  before_action :load_order, only: [:create]

  def index
    @order_items = OrderItem.all
  end

  def new
    @order_item = OrderItem.new
  end

  def edit
  end

  def show
  end

  def create
    # @order_item = OrderItem.new(order_item_params)
    @order_item = OrderItem.new(product_id: params[:product_id], order_id: @order.id)

    if @order_item.save
      redirect_to @order_item.order, notice: 'Item saved successfully.'
    else
       render :new
    end
  end

  def update
    if @order_item.update(order_item_params)
      redirect_to @order_item, notice: "Item was updated"
    else
      render :edit
    end
  end

  def destroy
    @order_item.destroy
    redirect_to order_item_url
  end

  private
  # before we add new item
  def load_order
    begin
      @order = Order.find(session[:order_id])               
    rescue ActiveRecord::RecordNotFound
      @order = Order.create(status: "not submitted yet!")
      session[:order_id] = @order_id
    end
  end

  def set_item
    @order_item = OrderItem.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:product_id, :order_id, :quantity) 
  end
end
