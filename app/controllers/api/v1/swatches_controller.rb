class Api::V1::SwatchesController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :load_user_by_jti, only: :create

  def index
    @swatches = Swatch.all.limit(8)
  end

  def show
    @swatch = Swatch.find(params.expect(:id))
  end

  def create
    if @user
      swatch = Swatch.new()
      swatch.name = params[:swatch][:name]
      swatch.user = @user

      puts swatch.to_json
      
      if swatch.save!
        fills = Fill.find(params[:swatch][:fill_ids])

        fills.each do |fill|
          swatch.fills << fill
        end

        render json: {
          messages: "Swatch create",
          is_success: true,
          swatch_id: swatch.id
        }, status: :ok
      end
    else
      render json: {
        messages: "Unauthorized",
        is_success: false,
      }, status: :unauthorized
    end
  end

  private

    # def swatch_params
    #   params.expect(swatch: [ :name, :fill_ids ])
    # end

    def load_user_by_jti
      @user = User.find_by_jti(decrypt_payload[0]['jti'])

      unless @user
        render json: {
          messages: "Sign Out Failed - Unauthorized",
          is_success: false,
        }, status: :unauthorized
      end
    end

    def decrypt_payload
      bearer = request.headers["Authorization"]
      jwt = bearer.split(' ').last
      jwt_signing_key = Rails.application.credentials.jwt_signing_key!
      token = JWT.decode(jwt, jwt_signing_key, true, { algorithm: 'HS256' })
    end

end
