class SessionsController < ApplicationController

  def new
    @user = User.new 
  end

  def create
    @user = User.find_or_create_from_auth_hash(auth_hash)
    # user = User.find_by_email(params[:email])
    # if user && user.authenticate(params[:password])
    #   session[:user_id] = user.id
    #   flash[:alert] = "Logged In"
    #   if user.is_admin
    #     redirect_to user_menus_path(user)
    #   else 
    #     redirect_to restaurants_path
    #   end
    # else
    #   flash[:alert] = "Wrong email or password"
    #   redirect_to '/login'
    # end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: "Logged out!"
  end

  # protected

  def auth_hash
    render json: request.env['omniauth.auth']
  end

end