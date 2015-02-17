class DishesController < ApplicationController
  before_action :dish_id, only: [:show, :edit, :update, :destroy]
  def index
    @dishes = Dish.all
  end

  def new
    @dish = Dish.new
  end

  def create
    @dish = Dish.new dishes_params
    if @dish.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @recipes = @dish.recipes.all
  end

  def edit
  end

  def update
    if @dish.update dishes_params
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    @dish.destroy
    redirect_to dishes_path
  end

  private
  def dishes_params
    params.require(:dish).permit(:name, :price, :description)
  end

  def dish_id
    @dish = Dish.find params[:id]
  end
end