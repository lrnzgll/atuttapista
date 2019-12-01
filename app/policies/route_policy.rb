class RoutePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end    
  end

  def initialize(user, record)
    @user = user
    @record = record
  end

  def show?
    true
  end
end
