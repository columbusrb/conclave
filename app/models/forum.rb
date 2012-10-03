class Forum < ActiveRecord::Base
  has_many :conversations, dependent: :destroy, inverse_of: :forum
  validates_presence_of :title

  attr_accessible :title

  def to_param
    "#{id}-#{title.parameterize}"
  end

  def last_comment
    @last_comment ||= conversations.last.try(:comments).try(:last)
  end

  def total_comments
    @total_comments ||= conversations.pluck(:comments_count).sum
  end

end
