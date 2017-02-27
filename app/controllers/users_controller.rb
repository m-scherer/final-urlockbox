class UsersController < ApplicationController

  skip_before_action :authenticate, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user_params[:password] != user_params[:password_confirmation]
      redirect_to :signup
      flash[:danger] = "Please ensure passwords match"
    elsif User.find_by(email: user.email)
      redirect_to :signup
      flash[:danger] = "Please select a unique email"
    elsif user.save
      session[:user_id] = user.id
      redirect_to :root
    else
      redirect_to :signup
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end

end
