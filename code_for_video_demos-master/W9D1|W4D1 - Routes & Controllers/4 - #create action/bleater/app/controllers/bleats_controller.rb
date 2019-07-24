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

  def create
    bleat_params = params.require(:bleat).permit(:author_id, :body)
    bleat = Bleat.new(bleat_params)

    if bleat.save
      render json: bleat
    else
      render json: bleat.errors.full_messages, status: 422
    end
  end

end