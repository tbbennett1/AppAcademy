class ApplicationController < ActionController::Base
  # skip_before_action :verify_authenticity_token

  helper_method :current_user, :logged_in?


  def logged_in?
    !!current_user
    # !!nil => false
    # !!user => true
  end

  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def ensure_user_logged_in
    unless logged_in?
      flash[:error] = "Must be logged in for that!"
      redirect_to new_session_url
    end
  end
end
