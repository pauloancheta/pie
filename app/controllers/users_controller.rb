class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      flash[:alert] = "Registration successful"
      redirect_to '/'
    else
      flash[:alert] = "Error! You may have registered with an invalid email or password."
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :address, :phone_number, :email, :password, :is_admin)
  end

end

