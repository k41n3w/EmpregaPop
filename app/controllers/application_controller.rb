class ApplicationController < ActionController::Base
  # XXX Refatorar
  before_action :authenticate_user!
end
