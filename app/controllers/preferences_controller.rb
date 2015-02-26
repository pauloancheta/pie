class PreferencesController < ApplicationController
  before_action :authenticate_user!

  def show
    @preference = current_user.preference
    @ingredients = current_user.recipe.ingredients
    @ingredient = @ingredients.new
  end

  def update
    @preference = current_user.preference
    if @preference.update preference_params
      redirect_to preference_path(@preference)
    else
      redirect_to restaurants_path
    end
  end




  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :category)
  end

  def preference_params
    params.require(:preference).permit(:diet)
  end

end