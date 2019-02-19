class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :set_variant

  def set_variant
    request.variant = browser.device.mobile? ? :sp : ''
  end
end
