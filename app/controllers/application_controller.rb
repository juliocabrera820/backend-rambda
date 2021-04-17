class ApplicationController < ActionController::API
  rescue_from ActiveRecord::RecordNotFound, with: :not_found
  rescue_from ActiveRecord::RecordInvalid, with: :invalid
  rescue_from CanCan::AccessDenied, with: :access_denied
  class AuthenticationError < StandardError; end
  rescue_from AuthenticationError, with: :unauthenticated

  private

  def not_found
    render json: { message: 'record was not found' }, status: :unprocessable_entity
  end

  def invalid
    render json: { message: 'record invalid' }, status: :unprocessable_entity
  end

  def current_user
    raise AuthenticationError unless auth_header

    payload = AuthenticationService.decode_token(request)
    raise CanCan::AccessDenied unless payload

    UsersRepository.new.show(payload['user_id'])
  end

  def access_denied
    render json: { message: 'you are not authorized' }, status: :forbidden
  end

  def unauthenticated
    render json: { message: 'please log in' }, status: :unauthorized
  end

  def auth_header
    request.headers['Authorization']
  end
end
