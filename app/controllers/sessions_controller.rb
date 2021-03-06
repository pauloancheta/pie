class SessionsController < ApplicationController

  def new
    if user_signed_in?
      redirect_to restaurants_path
    else
      @user = User.new 
    end
  end

  def create
    if auth_hash
      user = User.find_or_create_from_auth_hash(auth_hash)
      session[:user_id] = user.id
      flash[:notice] = "Welcome #{current_user.name}"
      redirect_to restaurants_path
    else
      user = User.find_by_email(params[:email])
      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        if user.is_admin
          redirect_to user_menus_path(user), notice: "Welcome #{current_user.name}"
        else 
          flash[:notice] = "Welcome #{current_user.name}"
          redirect_to restaurants_path
        end
      else
        flash[:alert] = "Wrong email or password"
        redirect_to '/login'
      end
    end
    
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: "Logged out!"
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end

end