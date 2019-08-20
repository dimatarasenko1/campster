class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end

    def show
      record.user == user
    end

    def index
      true
    end

    def create?
      current_user != record.campsite.user
    end

    def update
      current_user == record.user && current_user != record.campsite.user
    end
  end
end
