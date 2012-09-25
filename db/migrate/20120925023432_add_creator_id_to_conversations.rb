class AddCreatorIdToConversations < ActiveRecord::Migration
  def change
    add_column :conversations, :creator_id, :integer
    add_index :conversations, :creator_id
  end
end
