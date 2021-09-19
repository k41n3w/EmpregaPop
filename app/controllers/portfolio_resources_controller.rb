class PortfolioResourcesController < ApplicationController
  before_action :load_portfolio

  def index
    @resources = load_portfolio_resources
    authorize @portfolio, policy_class: PortfolioResourcePolicy
    render_resource(@resources)
  end

  def create
    @resource = build_portfolio_resource
    authorize @resource.portfolio
    @resource.attributes = portfolio_resource_params
    save_resource || render_error(@resource.errors.full_messages)
  end

  def update
    @resource = load_portfolio_resource
    authorize @resource.portfolio
    @resource.attributes = portfolio_resource_params
    save_resource || render_error(@resource.errors.full_messages)
  end

  def destroy
    @resource = load_portfolio_resource
    authorize @resource.portfolio
    destroy_resource || render_error("This resource can't be destroyed")
  end

  private

  def destroy_resource
    head :ok if @resource.destroy
  end

  def save_resource
    render_resource(@resource) if @resource.save
  end

  def render_resource(resource)
    render json: { resource: resource }
  end

  def render_error(message)
    render json: { errors: message }, status: :unprocessable_entity
  end

  def load_portfolio
    @portfolio = Portfolio.find(params[:portfolio_id])
  end
end
