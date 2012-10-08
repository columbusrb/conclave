class AddRedactedFieldsToComments < ActiveRecord::Migration
  def change
    add_column :comments, :redacted, :boolean, default: false
    add_column :comments, :redacted_at, :datetime
    add_column :comments, :redactor_id, :integer
    add_index  :comments, :redactor_id
  end
end
