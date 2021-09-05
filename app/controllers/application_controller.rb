class ApplicationController < ActionController::Base
  # XXX Refatorar
  before_action :authenticate_user!

  include Pundit

  rescue_from Pundit::NotAuthorizedError do
    respond_to do |format|
      format.html { redirect_to root_path, flash: { error: 'Unauthorized' } }
    end
  end
end
