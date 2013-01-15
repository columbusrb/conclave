class CreateNicknamesForExistingUsers < ActiveRecord::Migration
  def up
    User.where(:nickname => nil).each do |user|
      user.nickname = user.email
      user.save
    end
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
