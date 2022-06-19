class Admin::FoodsController < Admin::BaseController
  def index
    @foods = Food.all
  end
end
