class CreateBanishments < ActiveRecord::Migration
  def up
    add_column :users, :banned, :boolean, :default => false
    add_column :users, :banned_at, :datetime
    add_column :users, :banned_until, :datetime
    add_column :users, :ip, :string

    add_index :users, :banned
    add_index :users, :ip
  end

  def down
    remove_index :users, :column => :ip
    remove_index :users, :column => :banned

    remove_column :users, :ip
    remove_column :users, :banned_until
    remove_column :users, :banned_at
    remove_column :users, :banned
  end
end
