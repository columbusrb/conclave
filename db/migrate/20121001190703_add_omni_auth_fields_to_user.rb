class AddOmniAuthFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :provider, :string
    add_column :users, :secret, :string
    add_column :users, :token, :string
    add_column :users, :uid, :string

    add_index :users, [:provider, :uid]
  end
end
