class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  def current_user
    @user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in? 
    !!current_user
  end

  def require_logged_in
   redirect_to root_path if !logged_in?
  end

end
