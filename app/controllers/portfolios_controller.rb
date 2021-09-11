class PortfoliosController < ApplicationController

  def index
    authorize(Portfolio.all)
    @portfolios = policy_scope(Portfolio)
  end
end
