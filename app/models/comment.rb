class Comment < ActiveRecord::Base
  belongs_to :user, inverse_of: :comments
  belongs_to :conversation, touch: true, counter_cache: true, inverse_of: :comments
  has_many :uploaded_files, dependent: :destroy, inverse_of: :comment
  accepts_nested_attributes_for :uploaded_files

  acts_as_readable :on => :created_at

  attr_accessible :conversation_id, :user_id, :content, :uploaded_files_attributes
  validates_presence_of :user, :conversation, :content

  default_scope order("created_at ASC")
end
