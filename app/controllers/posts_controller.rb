class PostsController < ApplicationController

	
	before_action :is_authenticated?, except: [:index]

  def index #homepage
  	@posts = Post.all
  end

  def new
  	@post = Post.new
  end

  def create
  	post = Post.create post_params
  	redirect_to root_path
  end

  private 

  def post_params
  	params.require(:post).permit(:title, :link)
  end
end
