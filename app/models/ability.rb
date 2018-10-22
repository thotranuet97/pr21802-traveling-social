class Ability
  include CanCan::Ability

  def initialize user
    return if user.has_role? :admin && user
    can :access, :rails_admin
    can :manage, :all          
  end
end
