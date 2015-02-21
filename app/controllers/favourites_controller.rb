class FavouritesController < ApplicationController
  before_action :authenticate_user!
  before_action :find_user

  def create
    @favourite = @user.favourites.new
    @favourite.user = current_user
    @favourite.save
  end
  
  def destroy 
  end

  private

  def find_user
    @user = User.find params[:id]
  end

end
