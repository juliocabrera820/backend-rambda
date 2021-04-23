module Api
  module V1
    class SalesController < ApplicationController
      def index
        sales = SalesRepository.new.all(params[:user_id])
        render json: SalesPresenter.new(sales).as_json, status: :ok
      end

      def create
        if SalesRepository.new.create(sale_params)
          render json: { message: 'sale created successfully' }, status: :created
        else
          render json: lesson.error, status: :unprocessable_entity
        end
      end

      def show
        lesson = SalesRepository.new.show(params[:user_id], params[:course_id])
        render json: SalePresenter.new(lesson).as_json, status: :ok
      end

      private

      def sale_params
        params.except(:format).permit(:user_id, :course_id)
      end
    end
  end
end
