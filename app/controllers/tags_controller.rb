class TagsController < ApplicationController
  def index
    @tags = Tag.all.order(:title)
    render json: { tags: @tags }
  end
end
