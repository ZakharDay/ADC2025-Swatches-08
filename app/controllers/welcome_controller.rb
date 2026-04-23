class WelcomeController < ApplicationController

  def index
    @subscription = Subscription.new

    unless cookies[:jwt]
      uuid = SecureRandom.uuid
      payload = { guest_id: uuid }
      jwt_signing_key = Rails.application.credentials.jwt_signing_key!
      token = JWT.encode(payload, jwt_signing_key, 'HS256')
      cookies[:jwt] = token
    end

    @promo_swatches = Swatch.all.sample(3)
    @promo_fills = Fill.all.sample(12)
    # puts @promo_swatches.as_json(include: { fills: { include: { fill_colors: { include: :color } } } })
  end

  def about
  end

  def language
    locale = params[:locale] || I18n.default_locale
    current_user.update_attribute('locale', locale)
    redirect_back fallback_location: root_path
  end

end
