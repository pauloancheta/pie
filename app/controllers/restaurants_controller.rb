class RestaurantsController < ApplicationController
  def index
    if user_signed_in?
      if current_user.is_admin 
        redirect_to user_menus_path(current_user)
      else
        @restaurants = User.all.where(is_admin: true)
      end
    else 
      redirect_to login_path
    end
  end

  def favourite
    @user = User.find(session[:user_id])
  end
end