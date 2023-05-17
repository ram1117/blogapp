# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    if user.is? :admin
      can :manage, Post, Comment
    else
      can :read, Post, Comment
    end
  end
end
