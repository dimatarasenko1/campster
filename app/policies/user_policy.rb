class UserPolicy < ApplicationPolicy
  def show?
    record == user
  end

  def update?
    show?
  end

end
