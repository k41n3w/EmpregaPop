class PortfolioResourcePolicy < PortfolioPolicy
  def index?
    permitted_action?
  end
end
