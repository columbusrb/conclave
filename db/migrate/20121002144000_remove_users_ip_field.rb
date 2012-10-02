class RemoveUsersIpField < ActiveRecord::Migration
  def up
    remove_column :users, :ip
  end

  def down
    add_column :users, :ip
  end
end
