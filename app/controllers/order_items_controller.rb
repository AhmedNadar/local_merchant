class OrderItemsController < ApplicationController
  
  before_action :set_item, only: [:show, :edit, :update, :destroy]
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
    @order_item = current_user.current_cart.order_items.find_or_initialize_by_product_id(params[:product_id])
    @order_item.quantity +=1
    respond_to do |format|
      if @order_item.save
        format.html { redirect_to current_user.current_cart, notice: 'Successfully added product to cart.' }
        format.json { render action: 'show', status: :created, location: @order_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @order_item = OrderItem.find(params[:id])
    respond_to do |format|
      if order_item_params[:quantity].to_i == 0
        @order_item.destroy
        format.html { redirect_to @order_item.order, notice: 'Item was deleted from your cart.' }
        format.json { head :no_content }
      elsif @order_item.update(order_item_params)
        format.html { redirect_to @order_item.order, notice: 'Successfully updated the order item.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @order_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order_item.destroy
    respond_to do |format|
      format.html { redirect_to @order_item.order, notice: "Your #{@order_item.product.title} was deleted!" }
      format.json { head :no_content }
    end
  end

  private
  def set_item
    @order_item = OrderItem.find(params[:id])
  end

  def order_item_params
    params.require(:order_item).permit(:product_id, :order_id, :quantity) 
  end
end
