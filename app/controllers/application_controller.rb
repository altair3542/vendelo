class ApplicationController < ActionController::Base
  include Pagy::Backend
  around_action :set_locale

  def set_locale(&action)
    I18n.with_locale(params[:locale] || I18n.default_locale, &action)
  end

  private

  def locale_from_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end
