class PostsController < ApplicationController
    before_action :require_login

  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    @post.sub_id = params[:sub_id]
    @post.save
    flash.now[:errors] = @post.errors.full_messages
    redirect_to sub_url(@post.sub_id)
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
		@post = current_user.posts.find(params[:id])

		if @post.update_attributes(post_params)
			redirect_to sub_url(@post.sub_id)
		else
			flash[:errors] = @post.errors.full_messages
			redirect_to edit_post_url
		end
  end

  def post_params
    params.require(:post).permit(:title, :url, :content)
  end
end
