class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def show
      record.user == user
  end

  def index
    true
  end

  def create?
    user != record.campsite.user
  end

  def update
    user == record.user && user != record.campsite.user
  end
end
