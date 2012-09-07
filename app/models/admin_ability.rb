class AdminAbility

  include CanCan::Ability

  def initialize(user)
    can :manage, :all
  end
end