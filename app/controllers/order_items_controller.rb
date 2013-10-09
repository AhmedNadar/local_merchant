class OrderItemsController < ApplicationController
  
  before_action :set_item, only: [:show, :new, :update, :destroy]
  before_action :load_order, only: [:create]

  # def index
  #   @order_items = OrderItem.all
  # end

  # def new
  #   @order_item = OrderItem.new
  # end

  def edit
  end

  # def show
  # end

  def create    
    # @order_item = OrderItem.new(order_item_params)
    @order_item = @order.order_items.new(quantity:1, product_id: params[:product_id])
    # @order_item = OrderItem.new(product_id: params[:product_id], order_id: @order.id)

    respond_to do |format|
      if @order_item.save
        #redirect_to @order_item, notice: 'Item saved successfully.' }
        format.html { redirect_to @order, notice: 'Yeaay, successfully added product to cart.' }
        format.json { render action: 'show', status: :created, location: @order_item }
      else
         format.html { render action 'new' }
         format.json { render json: @order_item.errors, status: unprocessable_entity }
      end
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
    @order = Order.find_or_initialize_by_id(session[:order_id], status: "not submitted yet!")               
    if @order.new_record?
      @order.save!
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
