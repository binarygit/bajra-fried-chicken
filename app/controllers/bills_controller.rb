class BillsController < ApplicationController
  def index
    @bills = current_user.bills
  end

  def new
    @bill = Bill.new
    orders.each { |order| @bill.orders.build(order) }
  end

  def create
    @bill = Bill.new(attributes)
    if @bill.save
      cookies.delete :orders
      redirect_to root_path, notice: 'Orders successfully placed'
    else
      flash.now.alert = 'Something went wrong!'
      render :new, status_code: :internal_server_error
    end
  end

  def edit
  end

  def update
    bill = Bill.find(params[:id])
    flash.alert = 'Sorry something went wrong!' unless bill.update(paid: true)
    redirect_to admin_root_url
  end

  private

  def attributes
    attr_hash = {orders_attributes: {}}
    total = 0
    orders.each_with_index do |item, idx|
      attr_hash[:orders_attributes][idx] = item
      total += item['total']
    end

    attr_hash[:total] = total
    attr_hash[:user_id] = current_user.id
    return attr_hash
  end

  def orders
    orders ||= JSON.parse(cookies[:orders])
  end
end
