class RestaurantsController < ApplicationController
  def index
    if params[:search].present?
      @restaurants = User.all.where(is_admin: true).search params[:search]
    else
      @restaurants = User.all.where(is_admin: true)
    end
  end
end