class Conversation < ActiveRecord::Base
  acts_as_readable :on => :updated_at

  belongs_to :forum, inverse_of: :conversations, counter_cache: true, touch: true
  belongs_to :creator, class_name: 'User', inverse_of: :conversations
  has_many :comments, dependent: :destroy, inverse_of: :conversation
  has_many :watches, inverse_of: :conversation
  accepts_nested_attributes_for :comments

  attr_accessible :title, :forum_id, :comments_attributes, :creator_id
  validates_presence_of :forum, :title, :creator

  default_scope order('updated_at DESC')
  scope :sticky, where(:sticky => true)
  scope :closed, where(:closed => true)
  scope :regular, where(:sticky => false, :closed => false)

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def original_author
    creator
  end

  def participant_count
    comments.count(:user_id, distinct: true)
  end
end
