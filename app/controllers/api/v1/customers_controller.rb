module Api
  module V1
    class CustomersController < ApplicationController
      rescue_from ActiveRecord::RecordNotUnique, with: :not_unique

      def index
        customers = CustomersRepository.new.all
        render json: CustomersPresenter.new(customers).as_json, status: :ok
      end

      def create
        if CustomersRepository.new.create(customer_params)
          render json: { message: 'customer created successfully' }, status: :created
        else
          render json: course.error, status: :unprocessable_entity
        end
      end

      def show
        customer = CustomersRepository.new.show(params[:id])
        render json: CustomerPresenter.new(customer).as_json, status: :ok
      end

      def update
        if CoursesRepository.new.update(params[:id], course_params)
          render json: { message: 'Customer has been successfully updated' }, status: :ok
        else
          render json: { message: 'Customer could not be updated' }, status: :unprocessable_entity
        end
      end

      def destroy
        CustomersRepository.new.delete(params[:id])
        head :no_content
      end

      private

      def customer_params
        params.permit(:name, :email, :password)
      end

      def not_unique
        render json: { message: 'email must be unique' }, status: :unprocessable_entity
      end
    end
  end
end
