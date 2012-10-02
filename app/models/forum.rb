class Forum < ActiveRecord::Base
  has_many :conversations, dependent: :destroy, inverse_of: :forum
  validates_presence_of :title

  attr_accessible :title

end
