class RestaurantsController < ApplicationController
  def index
    @restaurants = User.all.where(is_admin: true)
  end

end