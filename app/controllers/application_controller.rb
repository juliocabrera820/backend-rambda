class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid
  rescue_from CanCan::AccessDenied, with: :access_denied

  private

  def not_found
    render json: { message: 'record was not found' }, status: :unprocessable_entity
  end

  def invalid
    render json: { message: 'record invalid' }, status: :unprocessable_entity
  end

  def current_user
    payload = AuthenticationService.decode_token(request)
    UsersRepository.new.show(payload['user_id'])
  end

  def access_denied
    render json: { message: 'you do not have permissions' }, status: :unauthorized
  end
end
