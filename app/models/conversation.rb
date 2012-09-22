class Conversation < ActiveRecord::Base
  belongs_to :forum
  has_many :comments, :dependent => :destroy
  accepts_nested_attributes_for :comments

  attr_accessible :title, :forum_id
  validates_presence_of :forum, :title

  def original_author
    comments.first.user
  end
end
