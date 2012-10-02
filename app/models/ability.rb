class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    if user.has_role?('admin')
      can :manage, :all
    elsif user.has_role?('moderator')
      can :manage, :all
    elsif user.has_role?('contributor') && user.email.present?
      can :read, :all
      can :manage, Comment, user_id: user.id
      can :create, [Comment, Conversation]
    else
      can :read, :all
    end
  end
end
