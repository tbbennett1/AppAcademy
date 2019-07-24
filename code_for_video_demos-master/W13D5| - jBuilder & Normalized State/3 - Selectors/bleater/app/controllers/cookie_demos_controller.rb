class CookieDemosController < ApplicationController

  def get_cookie
    # do stuff
    render :get_cookie
  end

  def set_cookie
    # do stuff
    if params[:dog]
      if cookies.signed[:dogs]
        dogs = JSON.parse(cookies.signed[:dogs])
      else
        dogs = []
      end
      dogs << params[:dog]
      cookies.signed[:dogs] = dogs.to_json
    end
    cookies[:my_cookie] = "Tommy"

    session[:my_secret] = "You will never knoooowwww!!"
    session[:my_array] = ["Mashu", "Tommy"]

    flash[:the_message] = "Hi from set_cookie!"

    render plain: "Set the cookie successfully"
  end

end