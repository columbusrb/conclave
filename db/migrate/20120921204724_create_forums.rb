class CreateForums < ActiveRecord::Migration
  def up
    create_table :forums do |t|
      t.string :title
    end

    add_column :conversations, :forum_id, :integer
    add_index :conversations, :forum_id
  end

  def down
    remove_index :conversations, :column => :forum_id
    remove_column :conversations, :forum_id

    drop_table :forums
  end
end
