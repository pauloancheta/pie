class SessionsController < ApplicationController

  def new
    @user = User.new 
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:alert] = "Logged In"
      redirect_to '/'
    else
      flash[:alert] = "Wrong email or password"
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login', notice: "Logged out!"
  end

end