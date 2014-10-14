class Post < ActiveRecord::Base
  belongs_to :author
  validates :title, :presence => {:message => "test"}
end