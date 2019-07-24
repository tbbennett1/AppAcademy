class CookieDemosController < ApplicationController

  def get_cookie
    # do stuff
    render :get_cookie
  end

  def set_cookie
    # do stuff
    if params[:dog]
      if cookies[:dogs]
        dogs = JSON.parse(cookies[:dogs])
      else
        dogs = []
      end
      dogs << params[:dog]
      cookies[:dogs] = dogs.to_json
    end
    cookies[:my_cookie] = "Tommy"
    render plain: "Set the cookie successfully"
  end

end