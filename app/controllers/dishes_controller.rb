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
    @dish.save
    redirect_to root_path
  end

  def show
  end

  def edit
  end

  def update
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