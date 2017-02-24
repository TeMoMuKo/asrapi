module Api::V2
  class ApiController < ActionController::API
    include DeviseTokenAuth::Concerns::SetUserByToken
    rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

    def record_not_found
      render json: { errors: I18n.t("exceptions.record_not_found") }, status: :not_found
    end
  end
end
