class Post < ActiveRecord::Base
  attr_accessible :content, :title

  validates :title, :content, :presence => true;
  validates :title, :uniqueness => true
  validates :title, :length => {:minimum => 4}
end
