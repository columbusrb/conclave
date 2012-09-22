class Conversation < ActiveRecord::Base
  belongs_to :forum
  has_many :comments, :dependent => :destroy

  validates_presence_of :forum

  def original_author
    comments.first.user
  end
end
