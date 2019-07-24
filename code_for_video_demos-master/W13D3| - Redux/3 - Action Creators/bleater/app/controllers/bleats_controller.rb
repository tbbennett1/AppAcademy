class BleatsController < ApplicationController

  before_action :ensure_user_logged_in, only: [:create, :new, :edit, :update, :destroy]

  def index
    # render plain: "Hello, World!"
    # render json: '{"tommy": "hello"}'
    # @bleats = Bleat.includes(:author).all
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

  # Potential CSRF attack on another website:
  <<-HTML
    <form action="http://bleater.com/bleats" method="POST">
      <input type="hidden" name="bleat[body]" value="All my secrets!!">
      <button>Win $1,000,000</button>
    </form>
  HTML

  def create
    # @bleat = Bleat.new(bleat_params)
    # @bleat.author_id = current_user.id
    @bleat = current_user.authored_bleats.new(bleat_params)

    if @bleat.save
      # render json: bleat
      flash[:success] = "Successfully created your bleat!"
      redirect_to bleat_url(@bleat.id)
    else
      flash.now[:error] = "Couldn't create the bleat. See below for errors."
      render :new, status: 422
    end
  end

  def edit
    @bleat = current_user.authored_bleats.find(params[:id])
    render :edit
  end

  def update
    @bleat = current_user.authored_bleats.find(params[:id])

    if @bleat.update(bleat_params)
      # render json: bleat
      redirect_to bleat_url(@bleat.id)
    else
      # render json: bleat.errors.full_messages, status: 422
      render :edit, status: 422
    end
  end

  def destroy
    bleat = current_user.authored_bleats.find(params[:id])
    bleat.destroy
    # render json: "Successfully destroyed the Bleat!"
    redirect_to bleats_url
  end

  private
  def bleat_params
    params.require(:bleat).permit(:body)
  end

end