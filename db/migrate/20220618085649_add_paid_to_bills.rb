class AddPaidToBills < ActiveRecord::Migration[7.0]
  def change
    add_column :bills, :paid, :boolean
  end
end
