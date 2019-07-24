class BleatsController < ApplicationController

  def index
    @bleats = Bleat.includes(:author).all
    # render json: bleats
    render :index
  end

  def show
    bleat = Bleat.find(params[:id])
    render json: bleat
  end

  def create
    bleat_params = params.require(:bleat).permit(:body, :author_id)
    bleat = Bleat.new(bleat_params)
    
    if bleat.save
      render json: bleat
    else
      render json: bleat.errors.full_messages, status: 422 
    end

  end

  def update
    bleat = Bleat.find(params[:id])

    bleat_params = params.require(:bleat).permit(:body, :author_id)
    if bleat.update(bleat_params)
      render json: bleat
    else
      render json: bleat.errors.full_messages, status: 422 
    end
  end

  def destroy
    bleat = Bleat.find(params[:id])
    bleat.destroy
    render plain: "Bleat destroyed!"
  end

end