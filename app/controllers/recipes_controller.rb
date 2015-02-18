class RecipesController < ApplicationController
  before_action :recipe_id, only: [:show, :edit, :update, :destroy]
  def index
    @recipes = Recipe.all
  end

  def new
    @dish = Dish.find params[:dish_id]
    @recipe = Recipe.new
  end

  def create
    @dish = Dish.find params[:dish_id]
    @recipe = @dish.recipes.new recipe_params
    if @recipe.save
      redirect_to dish_path(@dish)
    else
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
    params.require(:recipe).permit(:name, :dish_id)
  end

  def recipe_id
    @recipe = Recipe.find params[:id]
  end

end