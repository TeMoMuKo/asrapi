class SessionsController < DeviseTokenAuth::SessionsController
  def render_create_success
    render json: {
      data: @resource.as_json(methods: :team_number)
    }
  end
end
