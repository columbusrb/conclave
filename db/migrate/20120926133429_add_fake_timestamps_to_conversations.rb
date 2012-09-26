class AddFakeTimestampsToConversations < ActiveRecord::Migration
  # There is no down migration, it's be impossible to track
  def up
    Conversation.where(created_at: nil).update_all(created_at: Time.now)
    Conversation.where(updated_at: nil).update_all(updated_at: Time.now)
  end
end
