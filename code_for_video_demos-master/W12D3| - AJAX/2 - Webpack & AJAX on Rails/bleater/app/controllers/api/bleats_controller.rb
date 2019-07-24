class Api::BleatsController < ApplicationController

  def index
    bleats = Bleat.all
    render json: bleats
  end

end