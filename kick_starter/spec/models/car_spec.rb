require 'rails_helper'

RSpec.describe Car, :type => :model do
  
  context "with valid info" do
    
    subject { build(:car) }
    
    it { should be_valid }
    
  end
  
  context "with invalid info" do
    
    subject { build(:car, :invalid) }
    
    it { should be_invalid }
    
  end
  
end
 