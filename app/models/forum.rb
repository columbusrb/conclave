class Forum < ActiveRecord::Base
  has_many :conversations, :dependent => :destroy
  validates_presence_of :title

  attr_accessible :title

end
