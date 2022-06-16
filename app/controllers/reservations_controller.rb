class ReservationsController < ApplicationController
  def index
    @reservations = current_user.reservations
    @tables = current_user.tables.uniq
  end

  def new
  end

  def create
    reservation = Reservation.where(form_params)
    if reservation.empty?
      current_user.reservations.build(form_params).save!
      flash.notice = 'Reservation successfully made!'
    else
      flash.alert = 'Sorry, reservation has already been made for that date.'
    end

    redirect_to root_path
  end

  def destroy 
  end

  private

  def form_params
    { table_id: params[:table_id], reserved_for: params[:reservation_for] }
  end
end
