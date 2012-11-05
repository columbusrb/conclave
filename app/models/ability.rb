class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, [Forum, Conversation, Comment, Page]

    if user.present?
      if user.elevated?
        can :manage, :all
      else
        can :manage, Comment, user_id: user.id
        can :create, Conversation
        can :create, Comment, :conversation => { :closed => false }
      end
    end
  end
end
