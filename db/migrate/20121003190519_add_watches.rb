class AddWatches < ActiveRecord::Migration
  def up
    create_table :watches do |t|
      t.integer :user_id
      t.integer :conversation_id
    end

    add_column :conversations, :watches_count, :integer, :default => 0

    add_index :watches, [:user_id, :conversation_id]
  end

  def down
    remove_index :watches, :column => [:user_id, :conversation_id]
    remove_column :conversations, :watches_count
    drop_table :watches
  end
end
