class OrdersController < ApplicationController
  def index
  end

  def new
  end

  def create
    orders = JSON.parse(cookies[:orders])
    return redirect_to foods_path if orders.empty?
  end

  def destroy 
  end
end
