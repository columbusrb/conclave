class User < ActiveRecord::Base
  ROLES = %w[admin moderator contributor banned]

  has_many :conversations, foreign_key: :creator_id, inverse_of: :creator
  has_many :comments, inverse_of: :user
  has_many :watches, inverse_of: :user
  has_many :watched_conversations, through: :watches, source: :conversation

  acts_as_reader

  scope :role, lambda {|role| where(role: role)}
  scope :banned, where("banned is ?", true)
  scope :with_ip, lambda{|ip| where("last_sign_in_ip = ?", ip)}

  validates :role, inclusion: {in: User::ROLES}

  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessible :email, :password, :password_confirmation, :remember_me

  def self.find_or_create_with_social_media_account(oauth_hash)
    user = find_by_provider_and_uid(oauth_hash['provider'], oauth_hash['uid'])

    unless user.present?
      user = socially_create(oauth_hash)
    end

    user
  end

  def self.socially_create(oauth_hash)
    User.create do |u|
      u.nickname = oauth_hash['info']['nickname']
      u.provider = oauth_hash['provider']
      u.secret   = oauth_hash["credentials"]["secret"]
      u.token    = oauth_hash["credentials"]["token"]
      u.uid      = oauth_hash['uid']
    end
  end

  def name
    nickname || email
  end

  def has_role?(role)
    self.role == role
  end

  def elevated?
    has_role?("admin") || has_role?("moderator")
  end

  def ban!(length = 1.week)
    self.banned       = true
    self.banned_at    = Time.now
    self.banned_until = length.from_now.beginning_of_day
    self.save(:validate => false) # No validations, as Devise clobbers OmniAuth's lack of email
  end

  def unban!
    self.banned       = false
    self.banned_at    = nil
    self.banned_until = nil
    self.save(:validate => false) # No validations, as Devise clobbers OmniAuth's lack of email
  end

  def ban_current?
    return false unless banned_until.present?
    banned_until > Time.now
  end

  def ban_over?
    !ban_current?
  end

  def ban_end_date
    ends_at = banned_until || ip_banned_until
    ends_at.strftime('%m/%d/%Y') if ends_at.present?
  end

  def ip_banned_until
    IPBanCheck.new(self.last_sign_in_ip).banned_until
  end

  def watch!(conversation)
    self.watched_conversations << conversation
    self.save
  end

  def unwatch!(conversation)
    self.watched_conversations = watched_conversations.reject{|w| w == conversation}
    self.save
  end

  def watching?(conversation)
    self.watched_conversations.include?(conversation)
  end

end
