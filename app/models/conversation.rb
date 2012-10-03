class Conversation < ActiveRecord::Base
  belongs_to :forum, inverse_of: :conversations
  belongs_to :creator, class_name: 'User', inverse_of: :conversations
  has_many :comments, dependent: :destroy, inverse_of: :conversation
  accepts_nested_attributes_for :comments

  acts_as_readable :on => :created_at

  attr_accessible :title, :forum_id, :comments_attributes, :creator_id
  validates_presence_of :forum, :title, :creator

  default_scope order('updated_at DESC')

  def original_author
    creator
  end
end
