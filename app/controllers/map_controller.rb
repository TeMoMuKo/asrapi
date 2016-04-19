class MapController < ApplicationController
  def index
    @team_no = params[:team].delete("^0-9") if params[:team]
    @teams = Team.all
    @markers = Hash[Team.all.map { |team| [team.number, team.markers] }].to_json
  end
end
