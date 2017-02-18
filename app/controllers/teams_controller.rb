class TeamsController < ApplicationController
  before_action :set_team, only: [:show]
  respond_to :json

  ##
  # Returns a list of all Teams with their last known location
  #
  # GET /teams
  def index
    @teams = Team.includes(:locations)
      .order("locations.created_at ASC")
    render json: @teams.as_json({include: { locations: {} } })
  end

  ##
  # Returns a given Team
  #
  # GET /teams/:team_id
  #
  # params:
  #     team_id - id of Team to fetch
  def show
  end

  private
  def set_team
    @team = Team.friendly.find(params[:id])
  end

  def to_json(thing)
    thing.to_json({include: { locations: {} } })
  end
end
