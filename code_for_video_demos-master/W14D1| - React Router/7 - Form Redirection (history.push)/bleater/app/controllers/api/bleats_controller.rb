class Api::BleatsController < ApplicationController

  def index
    # sleep(3)
    @bleats = Bleat.includes(author: :authored_bleats).all
    # render json: bleats
    render :index
  end

  def show
    bleat = Bleat.find(params[:id])
    @bleats = [bleat]
    render :index
  end

  def create
    sleep(3)
    bleat = Bleat.new(bleat_params)

    if bleat.save
      # render json: bleat
      @bleats = [bleat]
      render :index
    else
      render json: bleat.errors.full_messages, status: 422
    end
  end

  private
  def bleat_params
    params.require("bleat").permit(:body, :author_id)
  end

end