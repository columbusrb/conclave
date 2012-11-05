class Page < ActiveRecord::Base
  validates :name, presence: true
  validates :permalink, presence: true, uniqueness: true, exclusion: {in: %w{new}}, format: {with: /[:alnum:]/}
  validates :content, presence: true
  attr_accessible :content, :name, :permalink

  def to_param
    permalink
  end
end
