class MapController < ApplicationController
  def index
    @teams = Team.all
    @polyline = Team.first.polyline
  end
end
