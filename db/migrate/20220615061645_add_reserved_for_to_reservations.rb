class AddReservedForToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :reserved_for, :date
  end
end
