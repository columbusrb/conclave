class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.string :name
      t.integer :comment_threshold

      t.timestamps
    end
    add_index :ranks, :comment_threshold
  end
end
