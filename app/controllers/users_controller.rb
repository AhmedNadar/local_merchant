class UsersController < ApplicationController

  def new
    @users = User.find(params[:id])
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to store_url, notice: "Signed Up!"
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :username, :password, :password_confirmation)
  end

end
