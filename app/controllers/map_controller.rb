class MapController < ApplicationController
  def index
    @teams = Team.all
    @markers = Team.first.markers
  end
end
