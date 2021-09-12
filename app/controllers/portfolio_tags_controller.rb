class PortfolioTagsController < ApplicationController
  def create
    build_portfolio_tag
    authorize @portfolio_tag
    save_portfolio_tag || render_error(@portfolio_tag.errors.full_messages)
  end

  def destroy
    @portfolio_tag = portfolio_tags_scope.find_by(tag_id: params[:tag_id])
    authorize @portfolio_tag
    destroy_portfolio_tag || render_error("This tag couldn't be removed")
  end

  private

  def save_portfolio_tag
    head :ok if @portfolio_tag.save
  end

  def destroy_portfolio_tag
    head :ok if @portfolio_tag.destroy
  end

  def render_error(message)
    render json: { errors: message }, status: :unprocessable_entity
  end

  def build_portfolio_tag
    @portfolio_tag = portfolio_tags_scope.build
    @portfolio_tag.tag_id = params[:tag_id]
  end

  def portfolio_tags_scope
    Portfolio.find(params[:portfolio_id]).portfolio_tags
  end
end
