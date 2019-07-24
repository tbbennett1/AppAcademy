class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to bleats_url
    else
      render :new
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :location_id)
  end

end