class CommentsController < ApplicationController
  before_action :set_project, only: [:new, :show, :edit, :update, :destroy]
  layout 'comment'
  def new
    @comments = @post.comments
    @comment = Comment.new
  end
  
  def create 
    @post = Post.find(params[:post_id])
    @comment = @post.comments.new(comment_params)
    @comment.user_id = session[:user_id]
    logger.info params[:post_id]
    if @comment.save
      redirect_to project_path(@post.project)
    end
  end
  private 
  def set_project
    @post = Post.find(params[:post_id])    
    end
  def comment_params
    params.require(:comment).permit(:content)
  end
  
end
