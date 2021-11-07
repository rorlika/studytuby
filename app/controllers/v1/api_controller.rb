class V1::APIController < ActionController::API
  include V1::Shared::ErrorRenderer

  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :bad_request
  rescue_from ActionController::ParameterMissing, with: :parameter_missing
end
