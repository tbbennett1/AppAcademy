class BandsController < ApplicationController
  def show
    @band = Band.find(params[:id])
    render :show
  end

  def index
    @bands = Band.all
    render json: @bands
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:errors] = @band.errors.full_messages
      render :new
    end
  end

  def destroy

  end

  def band_params
    params.require(:band).permit(:name)
  end
end
