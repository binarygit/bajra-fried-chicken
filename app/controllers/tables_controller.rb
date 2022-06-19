class TablesController < ApplicationController
  before_action :authenticate_user, only: :index

  def index
    @tables = Table.all
  end

  def show
    @table = Table.find(params[:id])
  end

  def edit
    @table = Table.find(params[:id])
  end

  def update
    @table = Table.find(params[:id])

    if @table.update(form_params)
      redirect_to @table
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(form_params)

    if @table.save
      respond_to do |format|
        format.turbo_stream do 
          render turbo_stream: turbo_stream.append('all_tables', partial: "tables/table",
                                                             locals: { table: @table })
        end
        format.html { redirect_to admin_table_path }
      end
    else
      render :new, status: :unprocessable_entity
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
