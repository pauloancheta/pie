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
  end

  private

  def find_favouriting_user
    @user = Favourite.find params[:user_id]
  end

end
