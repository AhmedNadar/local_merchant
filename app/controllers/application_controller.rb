class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  # before we add new item
  def load_order
    @order = Order.find_or_initialize_by_id(session[:order_id],
                                    user_id: session[:user_id], 
                                    status: "Not submitted yet!")
    if @order.new_record?
      @order.save!
      session[:order_id] = @order.id
    end
  end

  private
  def not_authenticated
    redirect_to login_url, :alert => "First log in to view this page."
  end
  
end