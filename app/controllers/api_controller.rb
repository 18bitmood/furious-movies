class ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound do |_exception|
		render_errors(errors: [{ key: 'not_found', message: 'Not found' }], status: :not_found)
	 end

  def render_errors(errors: [], status: :unprocessable_entity)
		render json: { errors: errors }, status: status
  end

  def render_resource_errors(resource, status: :unprocessable_entity)
		result = resource.errors.map do |error|
      { error.attribute => error.full_message }
  end
		render_errors errors: result, status: status
  end
end
