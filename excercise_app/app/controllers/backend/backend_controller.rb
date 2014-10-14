class Backend::BackendController < ApplicationController
  before_filter :require_login
  
  private
  def require_login
    unless session[:author_id]
      redirect_to new_login_path
    end
  end
end
