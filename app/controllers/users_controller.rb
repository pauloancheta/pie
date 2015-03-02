class UsersController < ApplicationController
  # respond_to :js  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    user_name_format(@user)
    if @user.save
      initialize_non_admin(@user) 
      session[:user_id] = @user.id
      flash[:alert] = "Registration successful"
      # render js: "window.location = '/restaurants'"
      # UserMailer.welcome_email(@user).deliver_now 
      redirect_to restaurants_path
    else
      # respond_to :js
      redirect_to root_path
    end
  end

  def show
    @user = User.find params[:id]
    # end
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def update
    @user = User.find(session[:user_id])
    if @user.update user_params
      @user.name.strip!
      @user.name.capitalize!
      @user.save!
      flash[:notice] = "Profile Updated!"
      render :show  
    else
      flash[:alert] = "Error in updating your profile"
      render :show
    end
  end

  def destroy
    @user = User.find(session[:user_id])
    if @user.destroy
      flash[:alert] = "Account deleted successfully!"
      redirect_to '/logout'
    else 
      flash[:alert] = "Error in deleting your account"
      render :show
    end
  end

  def menu
    @user = User.find params[:id]
    @menus = @user.menus
  end

  private


  def user_params
    params.require(:user).permit(:name, :address, :phone_number, :email, :password, :password_confirmation, :is_admin, :latitude, :longitude)
  end

  def user_name_format(user)
    user.name.strip!
    user.name.capitalize!
  end

  def initialize_non_admin(user)
    if user.is_admin != true
      r = Recipe.new
      r.name = "Allergy for user #{user.id}"
      r.save!

      p = Preference.new
      p.user_id = user.id
      p.recipe_id = r.id
      p.save
    end
  end

end

