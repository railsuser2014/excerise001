class User < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true, length: {minimum:5, maximum:10}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with:VALID_EMAIL_REGEX }
  has_secure_password
  has_many :projects
  has_many :comments
  has_many :pledges
 
  after_destroy :ensure_an_admin_remains #make sure only one user exist

  private
    def ensure_an_admin_remains
      if User.count.zero?
        raise "Can't delete last user"
      end
    end       
end
