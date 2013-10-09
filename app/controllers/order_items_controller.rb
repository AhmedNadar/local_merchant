class OrderItemsController < ApplicationController
  
  before_action :set_item, only: [:show, :new, :update, :destroy]

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
  
    @order_item = @order.Order_items.build params[:product]

    if @order_item.save
      redirect_to @order_item.order, notice: 'Item saved successfully.'
    else
       render :new
    end
  end

  def update
    if @order_item.upadte(order_item_params)
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
  def set_item
    @order_item = orderItem.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:product_id, :order_id, :quantity)
  end

end
