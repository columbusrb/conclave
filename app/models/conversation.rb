class Conversation < ActiveRecord::Base
  belongs_to :forum
  belongs_to :creator, class_name: 'User'
  has_many :comments, :dependent => :destroy
  accepts_nested_attributes_for :comments

  attr_accessible :title, :forum_id
  validates_presence_of :forum, :title, :creator
  
  default_scope order('updated_at DESC')

  def original_author
    creator
  end
end
