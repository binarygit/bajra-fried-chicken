class ApplicationController < ActionController::Base
  helper_method :logged_in?, :admin?

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
end
