class RecipesController < ApplicationController
  before_action :recipe_id, only: [:show, :edit, :update, :destroy]
  before_action :dish_id
  before_action :authenticate_user!
  def index
    @recipes = @dish.recipes.all
  end

  def new
    @recipe = @dish.recipes.new
  end

  def create
    if @dish.recipes.create(recipe_params)
      redirect_to menu_dish_path(@dish.menus.first, @dish)
    else
      flash[:alert] = @dish.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @recipe.update
      redirect_to dish_recipe_path(dish_id, @recipe)
    else
      render :edit
    end
  end

  def destroy
    @recipe.destroy
    redirect_to dish_path(dish_id)
  end

  private

  def recipe_params
    params.require(:recipe).permit(:name)
  end

  def recipe_id
    @recipe = Recipe.find params[:id]
  end

  def dish_id
    @dish = Dish.find params[:dish_id]
  end

end