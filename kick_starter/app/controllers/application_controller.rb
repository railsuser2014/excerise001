class ApplicationController < ActionController::Base
  before_action :authorize, except: [:index]
  protect_from_forgery with: :exception
  helper_method :current_user
  def index
    @projects = Project.last(3).reverse
     render '/index'
  end
  
  private 
  	#check session user id exist 
  
   def authorize  
     redirect_to login_url, notice: "Please log in" if session[:user_id].nil?
    end

    #get the current logged in user and it is used by all other controller
    def current_user
    	@current_user ||= User.find_by(:id, session[:user_id])
    end


  
end
