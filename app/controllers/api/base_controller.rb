class Api::BaseController < ActionController::API
  def render_error(message)
    render json: { message: message }, status: :bad_request
  end

  def render_ok
    render json: { message: 'OK' }
  end
end
