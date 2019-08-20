class ReviewPolicy < ApplicationPolicy
  def create?
    user == record.booking.user
  end
end
