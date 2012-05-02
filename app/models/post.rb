class Post < ActiveRecord::Base
  attr_accessible :content, :title
  belongs_to :user 

  validates :title, :content, :presence => true;
  validates :title, :uniqueness => true
  validates :title, :length => {:minimum => 4}
end
