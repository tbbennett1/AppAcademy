class SessionsController < ApplicationController

  
  def create 
    user = User.find_by_credentials(
      params[:user][:user_name],
      params[:user][:password]
    )
    
    if user.nil?
      session[:session_token] = user.reset_session_token!
      flash[:success] = "Logged in successfully. Welcome back!"
      redirect_to cats_url
    else
      flash[:error] = "Wrong username/password combo"
      render :new, status: 401
    end
  end
  
  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    flash[:success] = "Logged out successfully"
    redirect_to cats_url
  end
  
      def new
        render :new
      end
  
end