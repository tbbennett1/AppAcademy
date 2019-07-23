class UsersController < ApplicationController

  def show
    render json: User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
        render json: user
    else
        render json: user.errors.full_messages, status: :unprocessable_entity
    end
	end
		
	def update
    	# params[:id] is a routing parameter; more in a sec!
    	user = User.find(params[:id])
    	user.update!(user_params)
    	render json: user
	end
		
  def index
    # debugger
    if params[:user][:username]
      q = User.where('username LIKE ?', "#{params[:user][:username]}%")
    end
    render json: q
	end		


  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: user
  end

private
  def user_params
    params.require(:user).permit(:username)
  end
end