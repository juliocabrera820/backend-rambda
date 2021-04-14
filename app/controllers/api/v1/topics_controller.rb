module Api
  module V1
    class TopicsController < ApplicationController
      def index
        topics = TopicsRepository.new.all
        render json: TopicsPresenter.new(topics).as_json, status: :ok
      end

      def create
        if TopicsRepository.new.create(topic_params)
          render json: { message: 'topic created successfully' }, status: :created
        else
          render json: lesson.error, status: :unprocessable_entity
        end
      end

      def show
        topic = TopicsRepository.new.show(params[:id])
        render json: TopicPresenter.new(topic).as_json, status: :ok
      end

      def update
        if TopicsRepository.new.update(params[:id], topic_params)
          render json: { message: 'Topic has been successfully updated' }, status: :ok
        else
          render json: { message: 'Topic could not be updated' }, status: :unprocessable_entity
        end
      end

      def destroy
        TopicsRepository.new.delete(params[:id])
        head :no_content
      end

      private

      def topic_params
        params.except(:format).permit(:name)
      end
    end
  end
end
