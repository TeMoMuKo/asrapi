module Api
  module V1
    class SessionsController < DeviseTokenAuth::SessionsController
      def create
        render json: { error: "Zaktualizuj aplikację do najnowszej wersji" }, status: 418
      end

      def render_create_success
        render json: {
          data: @resource.as_json(methods: :team_number)
        }
      end
    end
  end
end
