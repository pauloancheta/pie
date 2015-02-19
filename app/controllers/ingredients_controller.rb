class IngredientsController < ApplicationController
  before_action :recipe_id, only: [:new, :create, :edit, :update, :destroy]
  before_action :ingredient_id, only: [:edit, :update, :destroy]
  def new
    @ingredient = @recipe.ingredients.new
  end

  def create
    @recipe = Recipe.find params[:recipe_id]
    if @recipe.ingredients.create ingredient_params
      redirect_to dish_recipe_path(@recipe.dish_id, @recipe)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ingredient.update ingredient_params
      redirect_to dish_recipe_path(@recipe.dish_id, @recipe)
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to dish_recipe_path(@recipe.dish_id, @recipe)
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:name, :category)
  end

  def recipe_id
    @recipe = Recipe.find params[:recipe_id]
  end

  def ingredient_id
    @ingredient = Ingredient.find params[:id]
  end
end