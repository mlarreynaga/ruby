class PostsController < ApplicationController	
  respond_to :json
  before_action :verify_requested_format!
 def index
	post = Post.all
    respond_with post
  end

  def create
	post = Post.create(post_params)  
    respond_with post
  end

  def show
	post = Post.find(params[:id])
    respond_with post
  end

  def upvote
    post = Post.find(params[:id])
    post.increment!(:upvotes)

    respond_with post
  end

  private
  def post_params
    params.require(:post).permit(:link, :title)
  end
end
