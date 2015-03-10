class IngredientsController < ApplicationController
  
  before_action :find_recipe, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_ingredient, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  
  def new
    @ingredient = @recipe.ingredients.new
  end

  def create
    ingredient = Ingredient.find_or_create(ingredient_params)
    if current_user.is_admin
      ingredient.recipes.push(@recipe)
      ingredient.save!
      redirect_to recipes_path
    else
      redirect_to preference_path(current_user.preference.id)
    end
  end

  def edit
  end

  def update
    if @ingredient.update ingredient_params
      redirect_to recipes_path
    else
      render :edit
    end
  end

  def destroy
    if @ingredient.destroy
      flash[:notice] = "Deleted!"
    else
      flash[:alert] = "Error in deleting!"
    end
    if current_user.is_admin
      redirect_to recipes_path
    else
      redirect_to preference_path
    end
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :category)
  end

  def find_recipe
    @recipe = Recipe.find params[:recipe_id]
  end

  def find_ingredient
    @ingredient = Ingredient.find params[:id]
  end

end