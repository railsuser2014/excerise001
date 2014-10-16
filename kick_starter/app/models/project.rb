class Project < ActiveRecord::Base
  belongs_to :user
  has_many :posts
  has_many :pledges
  
#   def fully_funded?
#     true
#   end
  
end
