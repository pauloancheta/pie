class PreferencesController < ApplicationController
  # before_action :authenticate_user!
  def index
    if current_user.preference.present?
      @preference = current_user.preference
    end
  end

  def new
    @preference = Preference.new
    @preference.user_id = current_user.id
  end

  def create
    @preference = Preference.new preferences_params
    @preference.save
  end

  def destroy
    @preference = Preference.find params[:id]
    @preference.destroy
  end

  private
  # diet should be a many to many. this is because there are only a set of diet that a user can be allergic to
  # it can also become just a provided string with validations. this will be discussed in the group
  def preferences_params
    params.require(:preference).permit(:user_id, :recipe_id, :diet)
  end

end