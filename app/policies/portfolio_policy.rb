class PortfolioPolicy < ApplicationPolicy
  def index?
    true
  end

  class Scope < Scope
    def resolve
      user.portfolios
    end
  end
end
