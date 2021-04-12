module Api
  module V1
    class SalesController < ApplicationController
      def index
        sales = SalesRepository.new.all
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
        lesson = SalesRepository.new.show(params[:id])
        render json: SalePresenter.new(lesson).as_json, status: :ok
      end

      private

      def sale_params
        params.except(:format).permit(:customer_id, :course_id)
      end
    end
  end
end
