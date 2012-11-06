class Page < ActiveRecord::Base
  PLACEMENTS = ['navbar', 'footer', '']
  validates :name, presence: true
  validates :permalink, presence: true, uniqueness: true, exclusion: {in: %w{new}}, format: {with: /[:alnum:]/}
  validates :content, presence: true
  validates :placement, inclusion: {in: PLACEMENTS}
  attr_accessible :content, :name, :permalink, :placement

  scope :in_footer, where(placement: 'footer')
  scope :in_navbar, where(placement: 'navbar')

  def to_param
    permalink
  end
end
