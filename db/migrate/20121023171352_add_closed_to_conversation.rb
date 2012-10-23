class AddClosedToConversation < ActiveRecord::Migration
  def change
    add_column :conversations, :closed, :boolean, :default => false
    add_index  :conversations, :closed
  end
end
