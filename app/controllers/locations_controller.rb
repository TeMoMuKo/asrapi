class LocationsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  before_action :set_team, only: [:index]
  before_action :set_location, only: [:show]

  def index
    @locations = @team.locations
  end

  def create
    @location = Location.new(location_params)
    @location.team = current_user.team
    if @location.save
      render json: @location, status: :created, location: @location
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  private
  def set_team
    @team = Team.friendly.find(params[:team_id])
  end

  def location_params
    params.require(:location).permit(:latitude, :longitude, :message, :image)
  end

end
