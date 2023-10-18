class Ability
  include CanCan::Ability

  def initialize(user)
    can :manage, :all, user:
  end
end
