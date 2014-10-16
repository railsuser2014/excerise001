require 'rails_helper'

RSpec.describe Project, :type => :model do
  
  context "with valid info" do    
    
    subject { Project.create(:title => "Hello World") }
    
    it { should be_valid } # .valid?
    #it "should be saveable" do
    #  subject.goal = 50
    #  subject.save
     # expect { subject.increase_goal(100) }.to change { subject.goal }.by(100)
    #end
  
  end
  context "with Invalid info" do 
    
  end
  
  
  
end