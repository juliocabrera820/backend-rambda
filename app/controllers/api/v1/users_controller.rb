module Api
  module V1
    class UsersController < ApplicationController
      def show
        customer = UsersRepository.new.show(params[:id])
        render json: UserPresenter.new(customer).as_json, status: :ok
      end

      def update
        if UsersRepository.new.update(params[:id], user_params)
          render json: { message: 'User has been successfully updated' }, status: :ok
        else
          render json: { message: 'User could not be updated' }, status: :unprocessable_entity
        end
      end

      def destroy
        UsersRepository.new.delete(params[:id])
        head :no_content
      end

      private

      def user_params
        params.permit(:name, :email, :password)
      end
    end
  end
end
