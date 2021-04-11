class CoursePresenter
  def initialize(course)
    @course = course
  end

  def as_json
    {
      id: course.id,
      name: course.name,
      description: course.description,
      duration: course.duration,
      image_url: course.featured_image.attachment.url,
      lessons: course.lessons
    }
  end

  private

  attr_reader :course
end
