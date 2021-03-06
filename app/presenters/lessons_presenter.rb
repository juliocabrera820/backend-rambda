class LessonsPresenter
  def initialize(lessons)
    @lessons = lessons
  end

  def as_json
    lessons.map do |lesson|
      {
        id: lesson.id,
        title: lesson.title,
        description: lesson.description,
        video_url: lesson.video_url
      }
    end
  end

  private

  attr_reader :lessons
end
