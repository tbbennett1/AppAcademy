class UsersController < ApplicationController


    def new 
        render :new
    end


    def create 
        @user = User.new(user_params)

        if @user.save
            session[:session_token] = @user.session_token
            flash[:success] = "Welcome to Rent-a-Cat! Account created successfully"
            redirect_to cats_url
          else
            render :new, status: 422
          end

    end 





    private

    def user_params
        param.require(:user).permit(:user_name, :password)
    end
    
    
    
    
end