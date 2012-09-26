class AddCommentCounterCacheToConversations < ActiveRecord::Migration
  def up
    add_column :conversations, :comments_count, :integer, default: 0
    Conversation.reset_column_information
    Conversation.find_each do |c|
      Conversation.update_counters c.id, comments_count: c.comments.count
    end
  end
  def down
    remove_column :conversations, :comments_count
  end
end
