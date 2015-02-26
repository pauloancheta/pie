class MenusController < ApplicationController
  before_action :menu_id, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index 
    @user = User.find params[:user_id]
    @menus = @user.menus.all
    @menu = Menu.new
  end 

  def new
  end

  def create
    @user = User.find params[:user_id]
    @menu = current_user.menus.new menu_params
    if current_user.is_admin
      if @menu.save
        redirect_to user_menus_path(@user)
      else
        render :new
      end 
    else
      flash[:alert] = "You dont have permissions to create a menu"
      redirect_to restaurants_path
    end
  end 

  def show 
    @dish = Dish.new
    @dishes = @menu.dishes.all
    @user = User.find(session[:user_id])
  end 


  def edit
  end 

  def update
    @user = User.find params[:user_id]
    if @menu.update menu_params
      redirect_to user_menus_path(@user)
    else
      render :edit
    end
  end 

  def destroy
    @user = User.find params[:user_id]
    @menu.destroy
    redirect_to user_menus_path(@user)
  end 


  private

  def menu_params
    params.require(:menu).permit(:name)
  end 

  def menu_id
    @menu = Menu.find params[:id]
  end 

end 