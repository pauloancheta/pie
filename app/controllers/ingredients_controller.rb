class IngredientsController < ApplicationController
  before_action :recipe_id, only: [:create, :update, :destroy]
  before_action :ingredient_id, only: [:edit, :update, :destroy]
  def new
    @ingredient = Ingredient.new
  end

  def create
    @recipe = Recipe.find params[:recipe_id]
    @ingredient = Ingredient.new ingredient_params
    if @ingredient.save
      redirect_to dish_recipe_path(@recipe.dish_id, @recipe.id)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @ingredient.update
      redirect_to dish_recipe_path(@recipe.dish_id, @recipe_id)
    else
      render :edit
    end
  end

  def destroy
    @ingredient.destroy
    redirect_to dish_path(@recipe.dish_id)
  end

  private
  def ingredient_params
    params.require(:ingredient).permit(:title, :category, :recipe_id)
  end

  def recipe_id
    @recipe = Recipe.find params[:params_id]
  end

  def ingredient_id
    @ingredient = Ingredient.find params[:id]
  end
end