class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :conversation

  scope :order, "created_at ASC"

end
