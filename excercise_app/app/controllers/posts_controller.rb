class PostsController < ApplicationController
  before_action :set_post, only: [:show]
  def index
    @posts = Post.where(:published =>  true)
  end
  
  def show
  end
  
  def set_post
    @post = Post.find(params[:id])
  end

end
