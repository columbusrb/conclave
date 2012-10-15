class AddStickyAndLockedToConversation < ActiveRecord::Migration
  def change
    add_column :conversations, :sticky, :boolean, :default => false
    add_column :conversations, :locked, :boolean, :default => false
    add_index :conversations, :sticky
    add_index :conversations, :locked
  end
end
