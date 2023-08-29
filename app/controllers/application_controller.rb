class ApplicationController < ActionController::Base
  include Pundit::Authorization

  before_action :authenticate_user!
  protect_from_forgery with: :exception
end
