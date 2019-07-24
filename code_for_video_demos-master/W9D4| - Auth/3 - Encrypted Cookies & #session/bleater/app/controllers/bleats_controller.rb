class BleatsController < ApplicationController

  def index
    # render plain: "Hello, World!"
    # render json: '{"tommy": "hello"}'
    @bleats = Bleat.includes(:author).all
    render :index
  end

  def show
    @bleat = Bleat.find(params[:id])
    render :show
  end

  def new
    @bleat = Bleat.new
    render :new
  end

  def create
    @bleat = Bleat.new(bleat_params)

    if @bleat.save
      # render json: bleat
      redirect_to bleat_url(@bleat.id)
    else
      render :new, status: 422
    end
  end

  def edit
    @bleat = Bleat.find(params[:id])
    render :edit
  end

  def update
    @bleat = Bleat.find(params[:id])

    if @bleat.update(bleat_params)
      # render json: bleat
      redirect_to bleat_url(@bleat.id)
    else
      # render json: bleat.errors.full_messages, status: 422
      render :edit, status: 422
    end
  end

  def destroy
    bleat = Bleat.find(params[:id])
    bleat.destroy
    # render json: "Successfully destroyed the Bleat!"
    redirect_to bleats_url
  end

  private
  def bleat_params
    params.require(:bleat).permit(:author_id, :body)
  end

end