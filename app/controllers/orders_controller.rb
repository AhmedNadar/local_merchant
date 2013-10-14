class OrdersController < ApplicationController
  
  before_action :set_order, only: [:show, :edit, :update, :destroy, :confirm]
  
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
      format.html { redirect_to @order, notice: 'Successfully added product to cart.' }
    else
      render :new
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params.merge(status: "Order is submitted"))
        session[:order_id] = nil
        format.html { redirect_to confirm_order_path(@order) }
      else
        render :edit
      end
    end
  end

  def destroy
    @order.destroy
    redirect_to store_path, notice: 'Your cart is empty, you can continue shopping!.'
  end

  def confirm
    @user = current_user
    UserMailer.order_confirmation(@user, @order).deliver
  end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:buyer_id, :status, :address_id)
  end

end