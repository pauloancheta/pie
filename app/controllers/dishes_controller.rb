class DishesController < ApplicationController
  
  before_action :dish_id, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  
  def create
    @menu = Menu.find params[:menu_id]
    if @menu.dishes.create(dishes_params)
      redirect_to user_menu_path(current_user, @menu)
    else
      render :new
    end
  end

  def show
    @recipes = current_user.recipes.all
    @line = current_user.recipes.where(category: "Line")
    @dry = current_user.recipes.where(category: "Spices")
    @vin = current_user.recipes.where(category: "Vinaigrette")
    @sauce = current_user.recipes.where(category: "Sauce")
    @stew = current_user.recipes.where(category: "Stew")
    @other = current_user.recipes.where(category: "Other")
    @none = current_user.recipes.where(category: nil)
  end

  def edit
    @menu = Menu.find params[:menu_id]
  end

  def update
    @user = current_user
    @menu = Menu.find params[:menu_id]
    if @dish.update dishes_params
      redirect_to user_menu_path(@user, @menu)
    else
      render :edit
    end
  end

  def destroy
    @menu = Menu.find params[:menu_id]
    @user = current_user
    @dish.destroy
    redirect_to user_menu_path(@user, @menu)
  end

  private
  def dishes_params
    params.require(:dish).permit(:name, :price, :description)
  end

  def dish_id
    @dish = Dish.find params[:id]
  end

  def menu_id
    @menu = Menu.find params[:menu_id]
  end
end