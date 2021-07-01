class ApiController < ActionController::API
  def render_errors(errors, status: :unprocessable_entity)
		render json: { errors: errors }, status: status
	end
end
