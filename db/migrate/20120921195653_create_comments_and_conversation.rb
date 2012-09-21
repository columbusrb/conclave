class CreateCommentsAndConversation < ActiveRecord::Migration
  def up
    create_table :comments do |t|
      t.integer :user_id
      t.integer :conversation_id
      t.integer :parent_id
      t.text :content
      t.timestamps
    end

    create_table :conversations do |t|
      t.string :title
    end

    add_index :comments, :conversation_id
  end

  def down
    remove_index :comments, :column => :conversation_id
    drop_table :conversations
    drop_table :comments
  end
end
