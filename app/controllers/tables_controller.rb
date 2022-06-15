class TablesController < ApplicationController
  before_action :authenticate_user, only: :index

  def index
    @tables = Table.all
  end

  def new
  end

  def create
  end

  def destroy 
  end

  private

  def authenticate_user
    redirect_to login_path unless logged_in?
  end
end
