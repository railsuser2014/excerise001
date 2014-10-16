require 'rails_helper'

RSpec.describe CarsController, :type => :controller do
  
  before do
    Car.create(:manufacturer => "asdsd")
#     post :logins, {:username => "something", :password => "something"}
  end
  
  describe "GET #index" do
    
    before { get :index }
    
    it { expect(response).to be_success }
    it { expect(response).to render_template :index }
    it { expect(assigns(:cars)).not_to be_empty }
    
  end
  
  describe "POST #create" do
    
    context "with valid data" do
      
      before { post :create, :car => attributes_for(:car) }
      
      it { expect(response).to redirect_to(root_path) }
      it { expect(assigns(:car)).not_to be_new_record }
      
    end
    
    context "with invalid data" do
      
      before { post :create, :car => attributes_for(:car, :invalid) }
      
      it { expect(response).to render_template :new }
      it { expect(assigns(:car)).to be_new_record }
      
    end
    
  end
  
  
  
end
