class ReservationsController < ApplicationController
  def index
    @reservations = current_user.tables
  end

  def new
  end

  def create
    current_user.reservations.build(table_id: params[:table_id]).save!
    redirect_to root_path
  end

  def destroy 
  end
end
