class User < ActiveRecord::Base

  has_many :conversations, foreign_key: :creator_id
  has_many :comments

  scope :role,  proc {|role| where(role: role)}

  ROLES = %w[admin moderator contributor banned]


  validates :role, inclusion: {in: User::ROLES}
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def self.find_or_create_with_social_media_account(oauth_hash)
    user = find_by_provider_and_uid(oauth_hash['provider'], oauth_hash['uid'])
    socially_create(oauth_hash) unless user.present?
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

end
