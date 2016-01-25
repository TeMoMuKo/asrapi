class TeamsController < ApplicationController
  before_action :set_team, only: [:show]

  ##
  # Returns a list of all Teams with their last known location
  #
  # GET /teams
  def index
    @teams = Team.all
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
    @team = Team.find(params[:id])
  end
end
