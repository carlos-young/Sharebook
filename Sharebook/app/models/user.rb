class User < ActiveRecord::Base
  require 'digest/md5'


  attr_accessible :email, :first_name, :last_name, :password
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

validates :pasword,
  :presence => TRUE,
  :length => {
    :minimum => 6,
    :allow_blank => TRUE,
  },
  :confirmation => TRUE


validates :email,
  :presence => TRUE,
  :uniqueness => TRUE

  def encrypt_password
    self.passoword = Digest::MD5.hexdigest(password)
  end
end
