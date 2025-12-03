class WelcomeController < ApplicationController
  before_action :switch_locale, only: :language

  def index
    @subscription = Subscription.new
  end

  def about
  end

  def language
    redirect_back fallback_location: root_path
  end

  private

    def switch_locale
      locale = params[:locale] || I18n.default_locale
      I18n.locale = locale
    end

end
