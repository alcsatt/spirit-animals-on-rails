class UserController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.find_by(email: params[:email])
    unless user
      @user = User.create(user_params)
      session[:user_id] = @user.id
      redirect_to root_path
    else
      @messages = ["user already exists"]
      redirect_to root_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
