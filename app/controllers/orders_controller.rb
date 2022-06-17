class OrdersController < ApplicationController
  def index
  end

  def new
  end

  def create
    orders = JSON.parse(cookies[:orders])
    unless orders.empty?
      bill = Bill.new(user_id: current_user.id)
      bill_total = 0
      orders.each do |order|
        bill_total += order['total']
        bill.orders.build(order)
      end
      bill.update(total: bill_total)
      flash.notice = 'Your order has been successfully placed.'
    end
    redirect_to foods_path
  end

  def destroy 
  end
end
