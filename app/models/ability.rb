# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, :all
    elsif user.instructor?
      can :manage, Course
    elsif user.user?
      can :read, Course
    end
  end
end
