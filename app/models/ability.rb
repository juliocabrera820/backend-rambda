# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.admin?
      can :manage, Topic
      can :update, Course
      can :read, User
    elsif user.instructor?
      can :manage, Course
      can :manage, Lesson
      can :read, User
    elsif user.user?
      can :read, Course
      can [:create, :read], Sale
      can :read, User
    end
  end
end
