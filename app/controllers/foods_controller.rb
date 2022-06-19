class FoodsController < ApplicationController
  def index
    @foods = Food.all
  end

  def show
    @food = Food.find(params[:id])
  end

  def edit
    @food = Food.find(params[:id])
  end

  def update
    @food = Food.find(params[:id])

    if @food.update(form_params)
      redirect_to @food
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def new
    @food = Food.new
  end

  def create
    @food = Food.new(form_params)

    if @food.save
      respond_to do |format|
        format.turbo_stream do 
          render turbo_stream: turbo_stream.append('all_foods', partial: "foods/food",
                                                   locals: { food: @food })
        end
        format.html { redirect_to admin_food_path }
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def form_params
    params.require(:food).permit(:name, :description)
  end
end
