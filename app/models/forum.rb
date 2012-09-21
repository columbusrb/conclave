class Forum < ActiveRecord::Base
  has_many :conversations, :dependent => :destroy

end
