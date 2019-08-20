class CampsitePolicy < ApplicationPolicy
  def create?
    true
  end

  def update?
    record.user == user
  end

  def show?
    true
  end

  def index?
    true
  end
end
