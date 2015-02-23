class RestaurantsController < ApplicationController
  def index
    if current_user.is_admin
      redirect_to user_menus_path(current_user)
    else
      @restaurants = User.all.where(is_admin: true)
    end
  end

end