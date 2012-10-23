class RemoveIndexOnConversationsOnLocked < ActiveRecord::Migration
  def up
    remove_index :conversations, :locked
  end

  def down
    # this will be one way since the column is already gone.
  end
end
