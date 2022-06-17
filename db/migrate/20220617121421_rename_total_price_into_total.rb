class RenameTotalPriceIntoTotal < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :total_price, :total
  end
end
