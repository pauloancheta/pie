class InclusionsController < ApplicationController
  def destroy
    ingredient = Ingredient.find params[:ingredient_id]
    recipe = Recipe.find params[:recipe_id]
    Inclusion.where(recipe_id: recipe.id, ingredient_id: ingredient.id).first.destroy
    if current_user.is_admin
      redirect_to recipes_path
    else
      redirect_to preference_path(current_user.preference.id)
    end
  end
end