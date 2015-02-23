class RestaurantsController < ApplicationController
  def index
    if current_user.is_admin
      redirect_to user_menus_path(current_user)
    else
      @restaurants = User.all.where(is_admin: true)
      @favourites = current_user.favourite_for(current_user)
    end
  end

end