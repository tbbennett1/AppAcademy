class BleatsController < ApplicationController

  def index
    # render plain: "Hello, World!"
    # render json: '{"tommy": "hello"}'
    bleats = Bleat.all
    render json: bleats
  end

end