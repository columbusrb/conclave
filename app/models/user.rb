class User < ActiveRecord::Base
  has_many :comments

  ROLES = %w[admin moderator contributor banned]


  validates :role, inclusion: {in: User::ROLES}
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me

  def has_role?(role)
    self.role == role
  end
end
