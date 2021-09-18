class BlocksController < ApplicationController
  before_action :load_portfolio

  def index
    render json: { blocks: @portfolio.blocks }
  end

  def create
    build_block
    save_block || render_error
  end

  def destroy
    @block = @portfolio.blocks.find(params[:id])
    destroy_block || render_error
  end

  private

  def build_block
    @block = @portfolio.blocks.build
    @block.attributes = block_params
  end

  def save_block
    @block.save && render(json: { block: @block }, status: :ok)
  end

  def destroy_block
    @block.destroy && head(:ok)
  end

  def render_error
    render json: { errors: @block.errors.full_messages }, status: :unprocessable_entity
  end

  def block_params
    params.require(:block).permit(:kind, :side)
  end

  def load_portfolio
    @portfolio = policy_scope(Portfolio).find(params[:portfolio_id])
    authorize @portfolio
  end
end
