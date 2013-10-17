class OrdersController < ApplicationController
  
  #before_action :require_login, only: [:show]
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
    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Successfully added product to cart.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new'}
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        @order.status = "Order is submitted"
        @order.save
        format.html { redirect_to confirm_order_path(@order), notice: "Horray, your order was updated." }
        format.json { head :no_content }
      else
        format.html { render action: 'show' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.order_items=[]
    @order.save
    respond_to do |format|
      format.html { redirect_to products_path }
      format.json { head :no_content }
    end
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
    params.require(:order).permit(:user_id, :status, :address_id)
  end

end