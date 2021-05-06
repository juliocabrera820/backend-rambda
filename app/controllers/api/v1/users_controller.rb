module Api
  module V1
    class UsersController < ApplicationController
      def show
        user = UsersRepository.new.show(params[:id])
        render json: UserPresenter.new(user).as_json, status: :ok
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
        params.except(:format).permit(:name, :email, :password, :role, :avatar)
      end
    end
  end
end
