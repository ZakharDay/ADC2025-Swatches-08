class WelcomeController < ApplicationController

  def index
    @subscription = Subscription.new
  end

  def about
  end

  def language
    locale = params[:locale] || I18n.default_locale
    current_user.update_attribute('locale', locale)
    redirect_back fallback_location: root_path
  end

end
