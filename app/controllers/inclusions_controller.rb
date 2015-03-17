class InclusionsController < ApplicationController
  def destroy
    ingredient = Ingredient.find params[:ingredient_id]
    recipe = Recipe.find params[:recipe_id]
    Inclusion.where(recipe_id: recipe.id, ingredient_id: ingredient.id).first.destroy
    redirect_to recipes_path
  end
end