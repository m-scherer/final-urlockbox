class UsersController < ApplicationController

  skip_before_action :authenticate, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user_params[:password] != user_params[:password_confirmation]
      flash[:danger] = "Please ensure passwords match"
      redirect_to :signup
    elsif User.find_by(email: user.email)
      flash[:danger] = "Please select a unique email"
      redirect_to :signup
    elsif user.save
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in"
      redirect_to :root
    else
      redirect_to :signup
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
