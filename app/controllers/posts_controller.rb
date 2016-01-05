class PostsController < ApplicationController

	
	before_action :is_authenticated?

  def index #homepage
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	Post.create post_params
  	redirect_to posts_path
  end

  private 

  def post_params
  	params.require(:post).permit(:title, :link)
  end
end
