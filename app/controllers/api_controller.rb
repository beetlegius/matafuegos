class ApiController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
  rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

  serialization_scope :view_context

  private

  def record_invalid(e)
    render json: { errors: e.record.errors }, status: 400
  end

  def record_not_found(e)
    render json: e.message, status: 404
  end

end
