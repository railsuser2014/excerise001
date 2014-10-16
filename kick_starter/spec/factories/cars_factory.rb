FactoryGirl.define do
  
  factory :microsoft do
  end
  
  factory :car do
    manufacturer "Nissan"
    
    trait :invalid do
      manufacturer ""
#       sometrhing ""
    end
    
    #assocation :organization, :factory => :microsoft
  end
  
end