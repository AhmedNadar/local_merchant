class OrdersController < ApplicationController
  
  #before_action :require_login, only: [:show]
  before_action :set_order, only: [:edit, :update, :destroy, :confirm]
  
  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def show

    @order = current_user.current_cart
    @amount = @order.total
  end

  def edit
  end

  def create
    
    @user = current_user
    @order = @user.orders.build(order_params)
    
    @order = Order.new(order_params)
    respond_to do |format|
      if @order.save
        format.html { redirect_to confirm_order_path(@order), notice: 'Successfully added product to cart.' }
        format.json { render action: 'show', status: :created, location: @order }
      else
        format.html { render action: 'new'}
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @amount = @order.total * 100 #<---this needs to be improved
    token = params[:stripeToken]
    
    

    respond_to do |format|
      if @order.update(order_params)
        @order.status = "Order is submitted"
        @order.save

        begin
          charge = Stripe::Charge.create(
          :amount => @amount.to_i, # amount in cents again
          :currency => "cad",
          :card => token
          )
        rescue Stripe::CardError => e
          redirect_to orders_path
        end


        format.html { redirect_to confirm_order_path(@order), notice: "Horray, your order is successfully submitted." }
        format.json { head :no_content }
      else
        format.html { render action: 'show' }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to products_path }
      format.json { head :no_content }
    end
  end

  def confirm
    @user = current_user
    UserMailer.order_confirmation(@user, @order).deliver 
  end

  # def pay_now
  #     # Amount in cents
  #   @amount = 500

  #   customer = Stripe::Customer.create(
  #     :email => 'example@stripe.com',
  #     :card  => params[:stripeToken]
  #   )

  #   charge = Stripe::Charge.create(
  #     :customer    => customer.id,
  #     :amount      => @amount,
  #     :description => 'Rails Stripe customer',
  #     :currency    => 'cad'
  #   )

  #   # rescue Stripe::CardError => e
  #   # flash[:error] = e.message
  #   # redirect_to store_path
  # end

  private
  def set_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:user_id, :status, :address_id)
  end

end