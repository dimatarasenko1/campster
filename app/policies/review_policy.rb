class ReviewPolicy < ApplicationPolicy

  def new?
    true
  end

  def create?
    user == record.booking.user
  end

  def update?
    create?
  end

  def destroy?
    create?
  end
end
