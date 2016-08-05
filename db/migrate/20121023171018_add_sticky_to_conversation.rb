class AddStickyToConversation < ActiveRecord::Migration
  def change
    add_column :conversations, :sticky, :boolean, :default => false
    add_index  :conversations, :sticky
  end
end
