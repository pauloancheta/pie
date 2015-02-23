class FavouritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @favourite = current_user.favourites.build(:favourited_user_id => params[:favourited_user_id])
    if @favourite.save
      flash[:notice] = 'Added to favourites'
      redirect_to root_path
    else
      flash[:alert] = 'Unable to favourite'
      redirect_to root_path
    end
  end
  
  def destroy 
    @restaurant = User.find params[:id]
    @favourite = current_user.favourites.where(user_id: current_user, favourited_user_id: @restaurant).first
    @favourite.destroy 
    flash[:notice] = 'Removed from favourites'
    redirect_to root_path
  end

  private

  def find_favourited_user
    @user = current_user.favourited_users
  end

end
