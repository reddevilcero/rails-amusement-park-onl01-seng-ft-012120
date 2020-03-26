class SessionsController < ApplicationController
  before_action :require_logged_in, except: [:login, :signin ]
  def login
    @users = User.all
    @user = User.new
  end

  def signin 
    if user = log_in_user(session_params)
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = 'Credentials does not match'
      redirect_to signin_path
    end
    # binding.pry
  
  end


  def logout
    session.clear 
    redirect_to root_path
  end

  private

  def log_in_user(params)
    User.find_by_id(params[:name]).try(:authenticate, params[:password])
  end

  def session_params
    params.require(:user).permit(:password, :name)
  end


end
