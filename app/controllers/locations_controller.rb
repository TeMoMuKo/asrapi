class LocationsController < ApplicationController
  before_action :set_team, only: [:create]
  before_action :set_location, only: [:update]

  def create
    @location = @team.locations.new(location_params)
    if @location.save
      render json: @location, status: :created, location: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  private
  def set_team
    @team = Team.find(params[:team_id])
  end

  def location_params
    params.require(:location).permit(:latitude, :longitude, :message)
  end

end
