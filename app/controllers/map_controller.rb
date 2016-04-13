class MapController < ApplicationController
  def index
    @teams = Team.all
    @markers = Hash[Team.all.map { |team| [team.id, team.markers] }].to_json
  end
end
