class TokenValidationsController < DeviseTokenAuth::TokenValidationsController
  def render_validate_token_success
    render json: {
      data: @resource.as_json(methods: :team_number)
    }
  end
end
