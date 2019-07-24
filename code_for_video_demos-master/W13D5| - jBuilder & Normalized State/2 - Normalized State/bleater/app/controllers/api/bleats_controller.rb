class Api::BleatsController < ApplicationController

  def index
    # sleep(3)
    @bleats = Bleat.includes(author: :authored_bleats).all
    # render json: bleats
    render :index
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