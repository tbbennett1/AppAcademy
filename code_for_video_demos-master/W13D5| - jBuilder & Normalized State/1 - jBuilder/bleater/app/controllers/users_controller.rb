class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      session[:session_token] = @user.session_token
      flash[:success] = "Welcome to Bleater! Account created successfully"
      redirect_to bleats_url
    else
      render :new, status: 422
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :location_id, :password)
  end

end