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
    bleat = Bleat.new(bleat_params)

    if bleat.save
      render json: bleat
    else
      render json: bleat.errors.full_messages, status: 422
    end
  end

  def update
    bleat = Bleat.find(params[:id])

    if bleat.update(bleat_params)
      render json: bleat
    else
      render json: bleat.errors.full_messages, status: 422
    end
  end

  def destroy
    bleat = Bleat.find(params[:id])
    bleat.destroy
    render json: "Successfully destroyed the Bleat!"
  end

  private
  def bleat_params
    params.require(:bleat).permit(:author_id, :body)
  end

end