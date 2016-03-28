class LocationsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_team, only: [:index]
  before_action :set_location, only: [:show]

  ##
  # Returns a list of Locations for a given Team
  #
  # GET /team/:team_id/locations
  #
  # params:
  #     team_id - id of Team to fetch locations for
  def index
    @locations = @team.locations
  end

  ##
  # Create a new location for a given team
  #
  # POST /locations
  #
  # params:
  #     team_id - id of Team to create a location for
  def create
    @location = current_user.team.locations.new(location_params)
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
