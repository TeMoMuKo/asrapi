module Api::V2
  class TeamsController < ApiController
    resource_description do
      formats ["json"]
    end

    expose :team, find_by: :slug

    api :GET, "/v2/teams", "Returns a list of all teams with their latest known location"
    def index
      sql = <<-SQL
        SELECT array_to_json(array_agg(teams))
        FROM (
          SELECT id,name,slug,
            (
              SELECT row_to_json(location)
              FROM (
                SELECT id,latitude,longitude,message,team_id,created_at,updated_at,address,country,country_code,NULLIF(image, '')
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

    api :GET, "/v2/teams/:slug", "Returns a team with all of it's locations"
    def show; end
  end
end
