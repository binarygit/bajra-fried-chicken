class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(form_params)

    if @user.save
      redirect_to root_path
    else
      render :new, status: :internal_server_error
    end
  end

  private

  def form_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
