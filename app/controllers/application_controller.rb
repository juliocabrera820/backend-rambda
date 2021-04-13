class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid

  private

  def not_found
    render json: { message: 'record was not found' }, status: :unprocessable_entity
  end

  def invalid
    render json: { message: 'record invalid' }, status: :unprocessable_entity
  end
end
