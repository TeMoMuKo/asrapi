class TeamsController < ApplicationController
  before_action :set_team, only: [:show]

  # GET /teams
  def index
    @teams = Team.all
  end

  # GET /teams/:team_id
  def show
  end

  private
  def set_team
    @team = Team.find(params[:id])
  end
end
