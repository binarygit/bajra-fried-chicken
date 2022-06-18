class CreatePaymentStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :payment_statuses do |t|
      t.string :state

      t.timestamps
    end
  end
end
