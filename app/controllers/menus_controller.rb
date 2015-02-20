class MenusController < ApplicationController
  before_action :menu_id, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  def index 
    @menus = Menu.all
  end 

  def new
    @menu = Menu.new
  end

  def create
    @menu = Menu.new menu_params
    if current_user.is_admin
      if @menu.save
        redirect_to menus_path
      else
        render :new
      end 
    else
      flash[:alert] = "You dont have permissions to create a menu"
      redirect_to root_path
    end
  end 

  def show 
    @dish = Dish.new
    @dishes = @menu.dishes.all
  end 


  def edit
  end 

  def update
    if @menu.update menu_params
      redirect_to menus_path
    else
      render :edit
    end
  end 

  def destroy
    @menu.destroy
    redirect_to menus_path
  end 


  private

  def menu_params
    params.require(:menu).permit(:name)
  end 

  def menu_id
    @menu = Menu.find params[:id]
  end 

end 