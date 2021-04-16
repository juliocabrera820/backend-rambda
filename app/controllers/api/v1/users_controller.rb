module Api
  module V1
    class UsersController < ApplicationController
      rescue_from ActiveRecord::RecordNotUnique, with: :not_unique

      def index
        users = UsersRepository.new.all
        render json: UsersPresenter.new(users).as_json, status: :ok
      end

      def create
        if UsersRepository.new.create(user_params)
          render json: { message: 'user created successfully' }, status: :created
        else
          render json: course.error, status: :unprocessable_entity
        end
      end

      def show
        customer = UsersRepository.new.show(params[:id])
        render json: UserPresenter.new(customer).as_json, status: :ok
      end

      def update
        if CoursesRepository.new.update(params[:id], course_params)
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

      def not_unique
        render json: { message: 'email must be unique' }, status: :unprocessable_entity
      end
    end
  end
end
