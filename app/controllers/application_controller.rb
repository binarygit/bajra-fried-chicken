class ApplicationController < ActionController::Base
  helper_method :logged_in?, :admin?
  before_action :require_login

  private

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

  def logged_in?
    return true if current_user
  end

  def admin?
    return true if current_user.access_level.name == 'admin'
  end

  def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_url # halts request cycle
    end
  end
end
