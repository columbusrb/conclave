class AddTimestampsToConversation < ActiveRecord::Migration
  def change
    add_timestamps(:conversations)
  end
end
