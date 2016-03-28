class TeamsController < ApplicationController
  before_action :set_team, only: [:show]

  ##
  # Returns a list of all Teams with their last known location
  #
  # GET /teams
  def index
    @teams = Team.all
    render json: @teams
  end

  ##
  # Returns a given Team
  #
  # GET /teams/:team_id
  #
  # params:
  #     team_id - id of Team to fetch
  def show
    render json: @team
  end

  private
  def set_team
    @team = Team.find(params[:id])
  end
end
