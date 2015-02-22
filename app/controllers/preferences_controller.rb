class PreferencesController < ApplicationController
  # before_action :authenticate_user!
  def show
    @preference = Preference.find params[:id]
    @ingredients = current_user.recipe.ingredients
    @ingredient = @ingredients.new
  end

  private
  # diet should be a many to many. this is because there are only a set of diet that a user can be allergic to
  # it can also become just a provided string with validations. this will be discussed in the group
  # def preferences_params
  #   params.require(:preference).permit(:user_id, :recipe_id, :diet)
  # end

  def ingredient_params
    params.require(:ingredient).permit(:name, :category)
  end

end