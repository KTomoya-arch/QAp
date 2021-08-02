class Admin::UsersController < ApplicationController
  def new
    @user = User.new
  end

  def index
    @users = User.all
  end

  def show
  end

  def create
    user = User.new(user_params)
    user.save!
    redirect_to login_path
  end

 def user_params
  params.require(:user).permit(:username, :email, :image, :password, :admin, :password_confirmation)
 end
end
