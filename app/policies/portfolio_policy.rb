class PortfolioPolicy < ApplicationPolicy
  def index?
    true
  end

  def create?
    true
  end

  def edit?
    true
  end

  class Scope < Scope
    def resolve
      @user.portfolios
    end
  end
end
