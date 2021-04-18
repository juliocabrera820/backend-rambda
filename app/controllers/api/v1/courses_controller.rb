module Api
  module V1
    class CoursesController < ApplicationController
      include CoursesHelper

      def index
        render json: CoursesPresenter.new(filter_courses(params)).as_json, status: :ok
      end

      def create
        if CoursesRepository.new.create(course_params)
          render json: { message: 'course created successfully' }, status: :created
        else
          render json: course.error, status: :unprocessable_entity
        end
      end

      def show
        course = CoursesRepository.new.show(params[:id])
        render json: CoursePresenter.new(course).as_json, status: :ok
      end

      def update
        if CoursesRepository.new.update(params[:id], course_params)
          render json: { message: 'Course has been successfully updated' }, status: :ok
        else
          render json: { message: 'Course could not be updated' }, status: :unprocessable_entity
        end
      end

      def destroy
        CoursesRepository.new.delete(params[:id])
        head :no_content
      end

      private

      def course_params
        params.except(:format).permit(:name, :description, :duration, :price, :featured_image, :level,
                                      :programming_language)
      end
    end
  end
end
