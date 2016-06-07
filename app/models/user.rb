class User < ActiveRecord::Base
  
  has_secure_password
  has_many :teachers
  has_many :students
  
  # validates :email, :presence => true, :uniqueness => true
  # validates :password_confirmation, :presence =>  true
  # validates :password, :confirmation => true
  # validates_length_of :password, :in => 6..20, :on => :create
  
end
