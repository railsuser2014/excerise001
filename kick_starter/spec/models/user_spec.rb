RSpec.describe User, :type => :model do
  context "with valid info" do 
    subject { User.create(name: "test", password: "abcd") }
    it {should be_valid}
  end
  
  
  context "with invlalid info " do
    subject { User.create() }
    it {should be_invalid}
  end
  
end
