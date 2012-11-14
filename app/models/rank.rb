class Rank < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :comment_threshold, presence: true, uniqueness: true, numericality: {integer: true}
  attr_accessible :comment_threshold, :name
end
