class RenameConversationLocked < ActiveRecord::Migration
  def up
    rename_column :conversations, :locked, :closed
    add_index :conversations, :closed
  end

  def down
    rename_column :conversations, :closed, :locked
    add_index :conversations, :locked
  end
end
