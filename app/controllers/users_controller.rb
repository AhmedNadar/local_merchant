class UsersController < ApplicationController

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  def index
    
  end

  def new
    @user = User.new
  end

  def show
    
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to store_url, notice: "Signed Up!"
    else
      render :new
    end
  end

  def edit
    
  end

  def update
    
  end

  def destroy
    
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password )
  end

end
