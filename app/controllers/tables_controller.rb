class TablesController < ApplicationController
  before_action :authenticate_user, only: :index

  def index
    @tables = Table.all
  end

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(form_params)

    if @table.save
      redirect_to admin_tables_path, notice: 'Table successfully created'
    else
      render :new
    end
  end

  def destroy 
  end

  private

  def authenticate_user
    redirect_to login_path unless logged_in?
  end

  def form_params
    params.require(:table).permit(:name, :description)
  end
end
