class CourseDecorator
  include Rails.application.routes.url_helpers

  def initialize(course)
    @course = course
  end

  def image_url
    if Rails.env.development?
      url_for(course.featured_image)
    elsif Rails.env.production?
      course.featured_image.attachment.url
    end
  end

  private

  attr_reader :course
end
