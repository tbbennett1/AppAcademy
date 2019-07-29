class ApplicationController < ActionController::Base

    #current_user
    #login
    #logout

    helper_method :current_user, :logged_in?

    def login(user)
        session[:session_token] = user.reset_session_token!
    end

    def current_user
        return nil unless session[:session_token]
        @current_user ||= User.find_by(session_token: session[:session_token])
    end

    def logged_in?
        !!current_user
    end

    def logout_user
        current_user.reset_session_token!
        session[:session_token] = nil
    end
end
