class User < ActiveRecord::Base
  ROLES = %w[admin moderator contributor banned]

  has_many :conversations, foreign_key: :creator_id, inverse_of: :creator
  has_many :comments, inverse_of: :user

  scope :role, proc {|role| where(role: role)}
  scope :banned, where("banned is ?", true)

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

  def self.ip_banned?(ip)
    banned.pluck(:last_sign_in_ip).compact.uniq.include?(ip)
  end

  def name
    nickname || email
  end

  def has_role?(role)
    self.role == role
  end

  def ban!(length = 1.week)
    self.banned       = true
    self.banned_at    = Time.now
    self.banned_until = length.from_now.beginning_of_day
    self.save
  end

  def unban!
    self.banned       = false
    self.banned_at    = nil
    self.banned_until = nil
    self.save
  end

end
