class Admin::BaseController < ApplicationController
  before_action :verify_admin
  layout 'admin'

  private

  def verify_admin
    redirect_back_or_to root_path, alert: 'Unauthorized Access.' unless admin?
  end
end
