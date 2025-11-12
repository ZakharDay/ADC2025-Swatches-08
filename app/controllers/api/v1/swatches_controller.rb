class Api::V1::SwatchesController < ApplicationController

  def index
    @swatches = Swatch.all.limit(8)
  end

  def show
    @swatch = Swatch.find(params.expect(:id))
  end

end
