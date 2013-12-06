class User < ActiveRecord::Base
  
  has_many :post

  require 'digest/md5'
  attr_accessible :first_name,:last_name,:email,:password
  before_save :encrypt_password
  
  validates :first_name,
  :presence => TRUE,
  :length => {
    :minimum => 2,
    :allow_blank => TRUE
  }

  validates :last_name,
  :presence => TRUE,
  :length => {
    :minimum => 2,
    :allow_blank => TRUE
  }

validates :password,
  :presence => TRUE,
  :length => {
    :minimum => 6,
    :allow_blank => TRUE,
  },
  :confirmation => TRUE


validates :email,
  :presence => TRUE,
  :uniqueness => TRUE

  def self.authenticate(email,password)
    user = find_by_email(email)
    if user && user.password == Digest::MD5.hexdigest(password)
      user
    else
      nil
    end
  end
  def encrypt_password
   if password.present?
     self.password = Digest::MD5.hexdigest(password)
   end
  end
end
