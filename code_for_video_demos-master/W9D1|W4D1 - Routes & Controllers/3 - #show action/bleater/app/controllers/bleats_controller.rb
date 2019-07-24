class BleatsController < ApplicationController

  def index
    # render plain: "Hello, World!"
    # render json: '{"tommy": "hello"}'
    bleats = Bleat.all
    render json: bleats
  end

  def show
    bleat = Bleat.find(params[:id])
    render json: bleat
  end

end