class Post < ActiveRecord::Base
  belongs_to :user
  attr_accessible :name , :info
end
