class CommentsController < ApplicationController


  def create
    com = Comment.new(com_params)
    if com.save
        render json: com
    else
        render json: com.errors.full_messages, status: :unprocessable_entity
    end
	end
		
  def index
    # debugger
    if params[:comment][:user_id]
        com = Comment.where(user_id: params[:comment][:user_id])
    elsif params[:comment][:artwork_id]
        com = Comment.where(artwork_id: params[:comment][:artwork_id])
    end
    
      render json: com
  end		

  def like
    like = Like.new(user_id: params[:user_id], likeable_id: params[:id], likeable_type: 'Comment')
    if like.save
      render json: like
    else
      render json: like.errors.full_messages, status: :unprocessable_entity
    end
  end

  def unlike
    like = Like.find_by(user_id: params[:user_id], likeable_id: params[:id], likeable_type: 'Comment')
    if like.destroy
      render json: like
    else
      render json: like.errors.full_messages, status: :unprocessable_entity
    end
  end

  def destroy
    com = Comment.find(params[:id])
    com.destroy
    render json: com
  end

private
  def com_params
    params.require(:comment).permit(:user_id, :artwork_id, :body)
  end
end