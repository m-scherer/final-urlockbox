class UsersController < ApplicationController

  skip_before_action :authenticate, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to :root
    else
      redirect_to :signup
    end
  end

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
