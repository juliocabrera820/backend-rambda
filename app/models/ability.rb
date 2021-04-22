# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, Topic
      can :update, Course
    elsif user.instructor?
      can :manage, Course
      can :manage, Lesson
    elsif user.user?
      can :read, Course
      can [:create, :read], Sale
    end
  end
end
