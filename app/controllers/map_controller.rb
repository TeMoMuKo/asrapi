class MapController < ApplicationController
  def index
    if params[:team]
      @team_no = params[:team].delete("^0-9")
      @title = "Mapa lokalizacji zespołu #{@team_no}" unless @team_no.empty?
    end
    @teams = Team.all
    @markers = Hash[Team.all.map { |team| [team.number, team.markers] }].to_json
  end
end
