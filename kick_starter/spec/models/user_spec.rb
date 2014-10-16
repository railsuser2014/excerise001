RSpec.describe User, :type => :model do
  context "with valid info" do 
    #subject { User.create(name: "test123", password: "abcd") }
    subject { build(:user) }
    it {should be_valid}
    it {should respond_to(:name) }
    it {should respond_to(:email) }
    
    
  end
  
  
  context "with invlalid info " do
    #subject { User.create() }
    subject { build(:user, :invalid)}
    it {should be_invalid}
  end
  
end
