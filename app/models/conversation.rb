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

  def self.seed
    forum = Forum.create(:title => "Seed forum")
    user  = User.first

    10.times do |i|
      forum.conversations.create do |c|
        c.title      = "Sticky Conversation #{i}"
        c.creator_id = user.id
        c.sticky     = true
      end
    end

    100.times do |i|
      forum.conversations.create do |c|
        c.title      = "Conversation #{i}"
        c.creator_id = user.id
      end
    end

    40.times do |i|
      forum.conversations.create do |c|
        c.title      = "closed Conversation #{i}"
        c.creator_id = user.id
        c.closed     = true
      end
    end
  end

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def original_author
    creator
  end
end
