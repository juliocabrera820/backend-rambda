module Api
  module V1
    class LessonsController < ApplicationController
      def index
        course_lessons = LessonsRepository.new.course_lessons(params[:course_id])
        render json: LessonsPresenter.new(course_lessons).as_json, status: :ok
      end

      def create
        if LessonsRepository.new.create(lesson_params, params[:course_id])
          render json: { message: 'lesson created successfully' }, status: :created
        else
          render json: lesson.error, status: :unprocessable_entity
        end
      end

      def show
        lesson = LessonsRepository.new.course_lesson(params[:course_id], params[:id])
        render json: LessonPresenter.new(lesson).as_json, status: :ok
      end

      #TODO: FIX
      def update
        if LessonsRepository.new.update(params[:id], lesson_params)
          render json: { message: 'Lesson has been successfully updated' }, status: :ok
        else
          render json: { message: 'Lesson could not be updated' }, status: :unprocessable_entity
        end
      end

      #TODO: FIX
      def destroy
        LessonsRepository.new.delete(params[:id])
        head :no_content
      end

      private

      def lesson_params
        params.except(:format).permit(:lesson_number, :title, :description, :video_url)
      end
    end
  end
end
