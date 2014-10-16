class PostsController < ApplicationController
  skip_before_action :authorize, only: [:index]
  before_action :prepare_project, only: [:create, :index] #allow user to create  only with project
  before_action :prepare_post, only: [:edit, :update, :destroy] #this is for editing and delete the post without project id
 
  def create
    @post = @project.posts.build(posts_params)
    @post.user_id = params[:user_id]    
    if @post.save
      redirect_to @project, :notice => "posted successfully"
    end
  end
  
  def edit
  end

  def update
     if @post.update(posts_params)
       redirect_to posts_path @post, :project_id=> @post.project.id, :notice => "Posted"
     end
  end
  
  def index
    @posts = @project.posts.select{|post| post.active != false } if @project.posts.count >0 
    @post = Array.new if @posts.nil?
  end

  def destroy
    @post.active=false
    @post.save
    redirect_to posts_path @post, :project_id=> @post.project.id, :notice => "deleted"
  end
  
  private
   
  def prepare_project
    @project = Project.find(params[:project_id])
    @project.posts.select! { |post| post.active ==true} #display only active post
    @post = @project.posts.find(params[:id]) if params[:id]
  end
  
  def prepare_post
#     @project = Project.find(params[:project_id])
    @post = Post.find(params[:id]) if params[:id]
  end
    
  def posts_params
    params.require(:post).permit(:content, :published)
  end
end
