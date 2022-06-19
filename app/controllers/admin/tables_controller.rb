class Admin::TablesController < Admin::BaseController
  def index
    @tables = Table.all
  end
end
