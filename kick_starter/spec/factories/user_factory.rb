FactoryGirl.define do
  
  
  factory :user do
    name "test123"
    email "test@gmail.com"
    password "12345"
    
    trait :invalid do
      name ""
      email "tst 23 .com"
    end
    
  end
  
end