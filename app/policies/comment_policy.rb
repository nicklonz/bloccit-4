# app/policies/comment_policy.rb

class CommentPolicy < ApplicationPolicy
  def destroy?
    user.present? && (record.user == user || user.role?(:admin) || user.role?(:moderator))
  end
end