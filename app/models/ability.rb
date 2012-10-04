class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Forum, Conversation, Comment]

    if user.present?
      if user.elevated?
        can :manage, :all
      else
        can :manage, Comment, user_id: user.id
        can :create, [Conversation, Comment]
      end
    end
  end
end
