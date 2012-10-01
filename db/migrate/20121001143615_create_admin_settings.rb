class CreateAdminSettings < ActiveRecord::Migration
  def up
    create_table :admin_settings do |t|
      t.string :setting
      t.string :value
    end

    add_index :admin_settings, :setting
  end

  def down
    remove_index :admin_settings, :column => :setting
    drop_table :admin_settings
  end
end
