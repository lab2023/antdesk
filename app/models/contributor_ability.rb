class ContributorAbility

  include CanCan::Ability

  def initialize(user)

    can :manage, Article #do |article|
      #article.application.contributors.include(user)
    #end
    can :manage, Category #do |category|
      #category.application.contributors.include(user)
    #end
    can :manage, Video #do |video|
      #video.application.contributors.include(user)
    #end
    can :manage, Application

  end
end