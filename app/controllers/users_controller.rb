class UsersController < ApplicationController
  before_action :current_user
  before_action :require_logged_in, except: [:welcome, :new, :create ]


  def welcome
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User successfully created"
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = "Something went wrong"
      render 'new'
    end
  end

  def show
    @user = User.find_by_id(session[:user_id])
  end
  
  

  private

  def user_params
    params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin )
  end

  
end
