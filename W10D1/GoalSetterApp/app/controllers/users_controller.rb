class UsersController < ApplicationController

    def new
        @user = User.new
        render :new
    end

    def index
      @user = User.new
      render :new
    end

    def show
        @user = User.find_by(params[:id])
        render :show
    end

    def create
        @user = User.new(user_params)

        if @user.save
            log_in(@user)
            flash[:success] = "WELCOME HOMIE"
            redirect_to new_session_url
        else
            render :new, status: 422
        end
    end

    private 
    def user_params
        params.require(:user).permit(:email, :password)
    end
end
