class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation

  attr_accessible :conversation_id, :user_id, :content
  validates_presence_of :conversation, :user

  scope :order, "created_at ASC"

end
