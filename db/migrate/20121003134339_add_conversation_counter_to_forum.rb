class AddConversationCounterToForum < ActiveRecord::Migration
  def change
    add_column :forums, :conversations_count, :integer, :default => 0

    Forum.all.each do |f|
      f.conversations_count = f.conversations.try(:count)
      f.save
    end
  end
end
