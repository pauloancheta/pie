class RecipesController < ApplicationController
  before_action :authenticate_user!
  respond_to :js

  def index
    @ingredient = Ingredient.new
    @recipe = current_user.recipes.new
    @recipes = current_user.recipes.order(:id)

    @line = current_user.recipes.where(category: "Line")
    @dry = current_user.recipes.where(category: "Spices")
    @vin = current_user.recipes.where(category: "Vinaigrette")
    @sauce = current_user.recipes.where(category: "Sauce")
    @stew = current_user.recipes.where(category: "Stew")
    @other = current_user.recipes.where(category: "Other")
    @none = current_user.recipes.where(category: nil)
  end

  def create
    @recipe = current_user.recipes.new recipe_params
    @recipe.save!
    respond_with()
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
    respond_with(@recipe)
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
    params.require(:recipe).permit(:name, :category)
  end

end