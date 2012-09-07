class ContributorAbility

  include CanCan::Ability

  def initialize(user)
      can :manage, Article
      can :manage, Category
      can :manage, Video
      can :read, Application
  end
end