# app/policies/topic_policy.rb

class TopicPolicy < ApplicationPolicy

  def index?
    true
  end

  def create?
    user.present? && user.role?(:admin)
  end

  def update?
    create?
  end
  
  def show?
    record.public? || user.present?
  end

end

private

def topic_params
  params.require(:topic).permit(:name, :description, :public)
end