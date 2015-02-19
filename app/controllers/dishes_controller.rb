class DishesController < ApplicationController
  before_action :dish_id, only: [:show, :edit, :update, :destroy]
  before_action :menu_id

  def create
    @menu = Menu.find params[:menu_id]
    if @menu.dishes.create(dishes_params)
      redirect_to menu_path(@menu)
    else
      render :new
    end
  end

  def show
    @recipes = @dish.recipes.all
    @recipe = Recipe.new
  end

  def edit
  end

  def update
    if @dish.update dishes_params
      redirect_to menu_path(@menu, @dish)
    else
      render :edit
    end
  end

  def destroy
    @dish.destroy
    redirect_to menu_path(@menu)
  end

  private
  def dishes_params
    params.require(:dish).permit(:name, :price, :description)
  end

  def dish_id
    @dish = Dish.find params[:id]
  end

  def menu_id
    @menu = Menu.find params[:menu_id]
  end
end