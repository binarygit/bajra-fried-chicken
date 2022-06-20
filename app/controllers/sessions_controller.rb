class SessionsController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash.notice = 'Logged in successfully'
      return redirect_to admin_root_url if admin?
      redirect_to root_url
    else
      flash.now[:alert] = 'Email or password is invalid'
      render :new, status: :unprocessable_entity
    end
  end

  def destroy 
    session[:user_id] = nil
    redirect_to root_path, notice: 'Logged out'
  end
end
