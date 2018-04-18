module Api::V3
  class LocationsController < ApiController
    resource_description do
      formats ["json"]
    end
    def_param_group :location do
      param :location, Hash do
        param :latitude, BigDecimal, "Precision: 10, scale: 6"
        param :longitude, BigDecimal, "Precision: 10, scale: 6"
        param :message, String
        param :image, String, "Image to store, must be encoded as '<MIME type>;base64,<base64 encoded data>'"
      end
    end

    before_action :authenticate_user!, only: [:create]
    expose :team, find_by: :slug
    expose :locations, -> { team.locations }
    expose :location, build_params: :location_params

    api :GET, "/v3/teams/:slug/locations", "Returns all locations for a given team"
    param :slug, String, "Name of team, ex. team-600"
    error 404, "Team doesn't exist"
    def index; end

    api :POST, "/v3/locations", "Create a new locations when authenticated"
    error 422, "Invalid location, see response for errors"
    param_group :location
    def create;
      location.team = current_user.team
      if location.save
        render "api/v3/locations/show", status: :created
      else
        render json: location.errors, status: :unprocessable_entity
      end
    end

    private

    def location_params
      params.require(:location).permit(:latitude, :longitude, :message, :image)
    end
  end
end
