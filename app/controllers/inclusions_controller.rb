class InclusionsController < ApplicationController
  def destroy
    @ingredient = Ingredient.find params[:id]
    @recipe = Recipe.find params[:recipe_id]
    @inclusion = Inclusion.where(recipe_id: @recipe.id, ingredient_id: @ingredient.id).first
    @inclusion.destroy!
    redirect_to recipes_path
  end
end