class SessionsController < ApplicationController

    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])

        if user
            login(user)
            flash[:success] = "You have logged in."
            redirect_to goals_url
        else
            flash.now[:errors] = "Email/Password is incorrect"
            redirect_to new_session_url
        end
    end

    def destroy
        current_user.reset_session_token!
        session[:session_token] = nil
        flash[:success] = "LOGOUT SUCCESSFUL"
        render json: "OOGABOOGA"
    end

end