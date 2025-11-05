class Api::V1::WelcomeController < ApplicationController
  def index
    swatches = Swatch.all
    render json: swatches
  end

  def preview
    swatches = User.first.swatches.limit(8)

    puts swatches.as_json

    render json: swatches.as_json
  end
end
