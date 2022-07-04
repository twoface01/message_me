class SessionsController < ApplicationController
  def new
  
  end
  
  def create
    user = User.find_by(username: params[:session][:username])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = "You have logged in successfully!"
      redirect_to root_path
    else
      flash.now[:error] = "Your login credentials were not accepted. Please try again."
      render 'new'
    end
  end
  
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have logged out successfully."
    redirect_to login_path
  end
end