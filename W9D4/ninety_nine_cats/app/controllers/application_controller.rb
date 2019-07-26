class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # skip_before_action :verify_authenticity_token

  helper_method :current_user, :logged_in?


  def logged_in?
    !!current_user
    # !!nil => false
    # !!user => true
  end

  def current_user
    return nil unless session[:session_token]
    User.find_by(session_token: session[:session_token])
  end
end
