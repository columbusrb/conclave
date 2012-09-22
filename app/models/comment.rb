class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation

  validates_presence_of :conversation, :user

  scope :order, "created_at ASC"

end
