class LocationsController < ApplicationController
  before_action :set_team, only: [:index, :create]
  before_action :set_location, only: [:show]

  def index
    @locations = @team.locations
  end

  # GET /locations/1
  def show
  end

  # POST /teams/:team_id/locations
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
