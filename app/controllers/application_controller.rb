class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern
  around_action :switch_locale

  rescue_from CanCan::AccessDenied do |exception|
    respond_to do |format|
      format.html { redirect_to root_path, alert: exception.message }
    end
  end

  def switch_locale(&action)
    if current_user.present?
      locale = current_user.locale
      I18n.with_locale(locale, &action)
    else
      yield
    end
  end
end
