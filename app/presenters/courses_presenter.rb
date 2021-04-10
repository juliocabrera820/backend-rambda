class CoursesPresenter
  include Rails.application.routes.url_helpers
  def initialize(courses)
    @courses = courses
  end

  def as_json
    courses.map do |course|
      {
        id: course.id,
        name: course.name,
        description: course.description,
        duration: course.duration,
        url: course.featured_image.attachment.service_url
      }
    end
  end

  private

  attr_reader :courses
end
