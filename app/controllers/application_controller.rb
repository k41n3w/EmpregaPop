class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  include Pundit

  rescue_from Pundit::NotAuthorizedError do
    respond_to do |format|
      format.html { redirect_to root_path, flash: { error: 'Unauthorized' } }
    end
  end

  def after_sign_in_path_for(resource)
    portfolios_path
  end
end
