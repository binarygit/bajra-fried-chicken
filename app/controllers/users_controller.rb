class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(form_params)

    if @user.save
      redirect_to root_path, notice: 'User successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def form_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation)
  end
end
