require 'rails_helper'

RSpec.describe SessionsController, :type => :controller do

   describe "GET #login" do    
     before{ get :new }
     it { expect(response).to be_success }
#      it { expect(response).to render_template :new }    
  end
  
  describe "logout" do    
    before{ delete :destroy }
    it { expect(response).to redirect_to(root_path) }
    it { expect(session[:user_id]).to be_nil }
  end
   
  
end
