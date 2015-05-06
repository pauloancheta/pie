class MenusController < ApplicationController 
  before_action :find_menu, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  respond_to :js 
  
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
        respond_with()
        # redirect_to user_menus_path(@user)
      else
        render :new
      end 
    else
      flash[:alert] = "You dont have permissions to create a menu"
      redirect_to restaurants_path
    end
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
    if @menu.destroy
      respond_with()
      flash[:alert] = "Menu deleted"
      #redirect_to user_menus_path(@user)
    else
      flash[:alert] = "Unable to delete menu"
    end
  end 


  private

  def menu_params
    params.require(:menu).permit(:name)
  end 

  def find_menu
    @menu = Menu.find params[:id]
  end 

end 