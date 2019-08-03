class DashboardPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end    
  end

  def initialize(user, record)
    @user = user
    @record = record
  end

  def home?
    @record == @user
  end
end
