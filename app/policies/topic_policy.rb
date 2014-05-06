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

  def show 
    record.public? || user_present?
  end
  
end
