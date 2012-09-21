class Topic < ActiveRecord::Base

  validates :name, uniqueness: true, presence: true
  validates :description, presence: true
  validates :slug, uniqueness: true, format: {with: /^[a-z0-9]$/, message: 'only lowercase letters and numbers.'}
  
  attr_accessible :description, :name, :slug

  def to_param
    slug
  end
end
