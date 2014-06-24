# app/policies/vote_policy.rb

class VotePolicy < ApplicationPolicy

  def index?
    true
  end
end