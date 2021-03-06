class TeamsController < ApplicationController
  before_action :set_team, only: [:show]
  respond_to :json

  # Praise PostgreSQL!
  def index
    sql = <<-SQL
      SELECT array_to_json(array_agg(teams))
      FROM (
        SELECT id,name,slug,
          (
            SELECT row_to_json(location)
            FROM (
              SELECT id,latitude,longitude,message,team_id,created_at,updated_at,address,country,country_code
              FROM locations
              WHERE team_id = teams.id
              ORDER BY created_at DESC
              LIMIT 1
            ) location
          ) as last_location
        FROM teams
      ) teams
    SQL
    render json: ActiveRecord::Base.connection.select_value(sql)
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
end
