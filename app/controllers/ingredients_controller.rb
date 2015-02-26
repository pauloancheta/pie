class IngredientsController < ApplicationController
  
  before_action :recipe_id, only: [:new, :create, :edit, :update, :destroy]
  before_action :ingredient_id, only: [:edit, :update, :destroy]
  before_action :authenticate_user!
  
  def new
    @ingredient = @recipe.ingredients.new
  end

  def create
    if current_user.is_admin == false
      @ingredient = current_user.recipe.ingredients.create ingredient_params
      @ingredient.save
      redirect_to preference_path(current_user.preference.id)
    elsif @recipe.ingredients.create ingredient_params
      redirect_to recipes_path
    else
      render :new
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
    redirect_to preference_path
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