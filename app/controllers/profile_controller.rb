class ProfileController < ApplicationController
  load_and_authorize_resource
  before_action :set_profile, only: %i[ show edit update ]

  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @profile.update(profile_params)
        format.html { redirect_to profile_show_path, notice: "Profile was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @profile }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @profile.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def set_profile
      @profile = current_user.profile
    end

    def profile_params
      params.expect(profile: [ :name ])
    end

end
