class PreferencesController < ApplicationController
  def index
    @user = User.find params[:user_id]
    @preferences = @user.preferences.all
  end

  def new
    @preference = Preference.new
  end

  def create
    @preference = Preference.new
    @preference.save
  end

  def destroy
    @preference = Preference.find params[:id]
    @preference.destroy
  end

  private

  def preferences_params
    params.require(:preference).permit(:user_id, :ingredient_id)
  end

end