class Car < ActiveRecord::Base
  
  validates :manufacturer, :presence => true
  
  belongs_to :organization
end
