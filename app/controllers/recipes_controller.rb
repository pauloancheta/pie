class RecipesController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def index
    @recipe = current_user.recipes.new
    @recipes = current_user.recipes.all
  end

  def create
    @recipe = current_user.recipes.new recipe_params
    @recipe.save!
    respond_with()
  end

  def show
  end

  def edit
    @recipe = Recipe.find params[:id]
  end

  def update
    @recipe = Recipe.find params[:id]
    if @recipe.update recipe_params
      redirect_to recipes_path
    else
      render :new
    end
  end

  def destroy
    @recipe = Recipe.find params[:id]
    @recipe.destroy
    redirect_to recipes_path
  end

  def add_recipe
    dish = Dish.find params[:dish_id]
    recipe = Recipe.find params[:id]
    dish.recipes << recipe

    render json: {success: true}
  end 

  def remove_recipe
    dish = Dish.find params[:dish_id]
    recipe = Recipe.find params[:id]
    dish.recipes.delete(recipe)

    render json: {success: true}
  end 

  private

  def recipe_params
    params.require(:recipe).permit(:name)
  end

end