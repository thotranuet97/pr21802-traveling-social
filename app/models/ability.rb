class Ability
  include CanCan::Ability

  def initialize user
    can :read, :all 
    can :access, :rails_admin
    if user.has_role? :admin
      can :manage, :all
    end
  end
end
