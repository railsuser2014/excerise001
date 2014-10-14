class LoginsController < ApplicationController
  def create 
    author = Author.where(:username => params[:username], :password => params[:password]).first
    if author
      session[:author_id] = author.id
      redirect_to backend_posts_path
    else
      render :new
    end
  end
  
  def new 
    
    
  end
  
  def logout 
    session[:author_id] = nil
    redirect_to root_path
  end
  
end
