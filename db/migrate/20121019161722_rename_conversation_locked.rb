class RenameConversationLocked < ActiveRecord::Migration
  def up
    rename_column :conversations, :locked, :closed
    rename_index :conversations, :locked, :closed
  end

  def down
    rename_index :conversations, :closed, :locked
    rename_column :conversations, :closed, :locked
  end
end
