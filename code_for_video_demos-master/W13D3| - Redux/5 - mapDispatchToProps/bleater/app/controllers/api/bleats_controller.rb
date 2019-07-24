class Api::BleatsController < ApplicationController

  def index
    sleep(3)
    bleats = Bleat.all
    render json: bleats
  end

  def create
    bleat = Bleat.new(bleat_params)

    if bleat.save
      render json: bleat
    else
      render json: bleat.errors.full_messages, status: 422
    end
  end

  private
  def bleat_params
    params.require("bleat").permit(:body, :author_id)
  end

end