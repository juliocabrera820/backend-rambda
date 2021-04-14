class CoursesPresenter
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
        price: course.price,
        image_url: CourseDecorator.new(course).image_url,
        level: course.level,
        programming_language: course.programming_language
      }
    end
  end

  private

  attr_reader :courses
end
