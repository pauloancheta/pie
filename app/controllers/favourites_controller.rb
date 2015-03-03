class FavouritesController < ApplicationController
  respond_to :js
  before_action :authenticate_user!

  def create
    @favourite = current_user.favourites.build(:favourited_user_id => params[:favourited_user_id])
    @favourite.save
    flash[:notice] = 'Added to favourites'
    respond_with(@favourite)
  end
  
  def destroy 
    @restaurant = User.find params[:id]
    @favourite = current_user.favourites.where(user_id: current_user, favourited_user_id: @restaurant).first
    @favourite.destroy 
    flash[:notice] = 'Removed from favourites'
    respond_with()
  end

  private

  def find_favourited_user
    @user = current_user.favourited_users
  end

end
