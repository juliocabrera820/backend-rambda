module Api
  module V1
    class AuthenticationController < ApplicationController
      before_action :set_user, only: [:sign_in]

      rescue_from ActiveRecord::RecordNotUnique, with: :not_unique

      def sign_up
        if UsersRepository.new.create(user_params)
          render json: { message: 'user created successfully' }, status: :ok
        else
          render json: { message: 'record invalid' }, status: :unprocessable_entity
        end
      end

      def sign_in
        return email_error unless @user
        return user_error unless @user.authenticate(params[:password])

        token = AuthenticationService.encode(@user)
        render json: token, status: :ok
      end

      private

      def user_params
        params.except(:format).permit(:name, :email, :password, :role, :avatar)
      end

      def set_user
        @user = UsersRepository.new.find_user_by_email(params[:email])
      end

      def not_unique
        render json: { message: 'email must be unique' }, status: :unprocessable_entity
      end

      def user_error
        render json: { message: 'password is wrong' }, status: :unprocessable_entity
      end

      def email_error
        render json: { message: 'email does not exist' }, status: :unprocessable_entity
      end
    end
  end
end
