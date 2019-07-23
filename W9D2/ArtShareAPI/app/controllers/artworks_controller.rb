class ArtworksController < ApplicationController

  def show
    render json: Artwork.find(params[:id])
  end

  def create
    artwork = Artwork.new(artwork_params)
    if artwork.save
        render json: artwork
    else
        render json: artwork.errors.full_messages, status: :unprocessable_entity
    end
	end
		
	def update
    	# params[:id] is a routing parameter; more in a sec!
    	artwork = Artwork.find(params[:id])
    	artwork.update!(artwork_params)
    	render json: artwork
	end
		
  def index
      render json: Artwork.index_method_owned_and_shared(params[:user_id])
	end		


  def destroy
    artwork = Artwork.find(params[:id])
    artwork.destroy
    render json: artwork
  end

  def favorite_artwork
    fav = Artwork.find_by(id: params[:id], artist_id: params[:user_id])
    fav.favorite = true
    fav.save
    render json: fav
  end

  def unfavorite_artwork
    fav = Artwork.find_by(id: params[:id], artist_id: params[:user_id])
    fav.favorite = false
    fav.save
    render json: fav
  end

  def like
    like = Like.new(user_id: params[:user_id], likeable_id: params[:id], likeable_type: 'Artwork')
    if like.save
      render json: like
    else
      render json: like.errors.full_messages, status: :unprocessable_entity
    end
  end
  def unlike
    like = Like.find_by(user_id: params[:user_id], likeable_id: params[:id], likeable_type: 'Artwork')
    if like.destroy
      render json: like
    else
      render json: like.errors.full_messages, status: :unprocessable_entity
    end
  end

private
  def artwork_params
    params.require(:artwork).permit(:title, :image_url, :artist_id, :favorite)
  end
end