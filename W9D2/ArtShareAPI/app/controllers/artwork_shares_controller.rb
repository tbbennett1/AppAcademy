class ArtworkSharesController < ApplicationController

  def create
    shared_artwork = ArtworkShare.new(artwork_share_params)
    if shared_artwork.save
        render json: shared_artwork
    else
        render json: shared_artwork.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def favorite
    fav = ArtworkShare.find_by(id: params[:id], viewer_id: params[:user_id])
    fav.favorite = true
    fav.save
    render json: fav
  end

  def favorite
    fav = ArtworkShare.find_by(id: params[:id], viewer_id: params[:user_id])
    fav.favorite = false
    fav.save
    render json: fav
  end

  def destroy
    shared_artwork = ArtworkShare.find(params[:id])
    shared_artwork.destroy
    render json: shared_artwork
  end

  def favorite_artworks
    fav = ArtworkShare.find(params[:favorite])
    fav.update!(artwork_share_params)
    render json: fav
  end

private
  def artwork_share_params
    params.require(:artwork_share).permit(:artwork_id, :viewer_id, :favorite)
  end
end