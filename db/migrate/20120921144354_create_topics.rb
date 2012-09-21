class CreateTopics < ActiveRecord::Migration
  def change
    create_table :topics do |t|
      t.string :name, null: false, unique: true
      t.text :description, null: false
      t.string :slug, null: false, unique: true

      t.timestamps
    end
    add_index :topics, :slug, uniqueness: true
  end
end
