class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :verify_admin

  private

  def verify_admin
    flash.alert = 'Unauthorized Access.'
    redirect_back_or_to root_path unless admin?
  end
end
