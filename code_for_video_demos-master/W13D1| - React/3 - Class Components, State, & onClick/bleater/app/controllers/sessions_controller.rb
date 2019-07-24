class SessionsController < ApplicationController

  def new
    render :new
  end

  def create
    user = User.find_by_credentials(
      params[:email],
      params[:password]
    )

    if user
      session[:session_token] = user.reset_session_token!
      flash[:success] = "Logged in successfully. Welcome back!"
      redirect_to bleats_url
    else
      flash.now[:error] = "Wrong email/password combo"
      render :new, status: 401
    end
  end

  def destroy
    current_user.reset_session_token!
    session[:session_token] = nil
    flash[:success] = "Logged out successfully"
    redirect_to bleats_url
  end

end