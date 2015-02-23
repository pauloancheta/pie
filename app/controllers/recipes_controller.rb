class RecipesController < ApplicationController

  before_action :authenticate_user!

  def index
    @recipe = Recipe.new
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new recipe_params
    if @recipe.save
      redirect_to recipes_path
    else 
      flash[:alert] = @recipe.errors.full_messages.join(', ')
      render :new
    end 
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
    d = Dish.find params[:dish_id]
    r = Recipe.find params[:id]
    d.recipes << r
  end 

  private

  def recipe_params
    params.require(:recipe).permit(:name)
  end

end