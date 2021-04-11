class LessonPresenter
  def initialize(lesson)
    @lesson = lesson
  end

  def as_json
    {
      id: lesson.id,
      lesson_number: lesson.lesson_number,
      title: lesson.title,
      description: lesson.description,
      video_url: lesson.video_url
    }
  end

  private

  attr_reader :lesson
end
