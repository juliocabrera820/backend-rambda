class CoursePresenter
  include Rails.application.routes.url_helpers
  def initialize(course)
    @course = course
  end

  def as_json
    {
      id: course.id,
      name: course.name,
      description: course.description,
      duration: course.duration,
      url: rails_blob_url(course.featured_image)
    }
  end

  private

  attr_reader :course
end
