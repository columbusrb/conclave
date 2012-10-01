class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation,
    touch: true,
    counter_cache: true

  attr_accessible :conversation_id, :user_id, :content
  validates_presence_of :user, :conversation, :content

  default_scope order("created_at ASC")
end
