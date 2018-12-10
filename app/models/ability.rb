class Ability
  include CanCan::Ability

  def initialize(user)
      if user.admin?
        can :manage, Product
      elsif user.guest?
        can :show, Product
      end
  end
end
