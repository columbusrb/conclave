class Comment < ActiveRecord::Base
  belongs_to :user, inverse_of: :comments
  belongs_to :conversation, touch: true, counter_cache: true, inverse_of: :comments
  belongs_to :redactor, class_name: User, inverse_of: :redacted_comments
  has_many :uploaded_files, dependent: :destroy, inverse_of: :comment
  accepts_nested_attributes_for :uploaded_files

  attr_accessible :conversation_id, :user_id, :content, :uploaded_files_attributes, :redacted, :redacted_at, :redactor_id
  validates_presence_of :user, :conversation, :content

  default_scope order("created_at ASC")
end
