class CollectionsController < ApplicationController

  def create
    col = Collection.new(collection_params)
    if col.save
        render json: col
    else
        render json: col.errors.full_messages, status: :unprocessable_entity
    end
  end
  
  def add_artwork
    col = ArtworkCollection.new(
      artwork_id: params[:artwork_id], 
      collection_id: params[:collection_id]
    )
    if col.save
      render json: col, status: :created
    else
      render json: col.errors.full_messages, status: :unprocessable_entity
    end
  end
   def remove_artwork
    col = ArtworkCollection.find_by(artwork_id: params[:artwork_id], collection_id: params[:collection_id])
    col.destroy
    render json: col
  end

  def destroy
    col = Collection.find(params[:id])
    col.destroy
    render json: col
  end

  def index
    col = Collection.where(user_id: params[:user_id])
    render json: col
  end

private
  def collection_params
    params.require(:collection).permit(:user_id, :name)
  end
end