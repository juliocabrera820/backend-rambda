class CoursesPresenter
  def initialize(courses)
    @courses = courses
  end

  def as_json
    courses.map do |course|
      course_decorator = CourseDecorator.new(course)
      {
        id: course.id,
        name: course.name,
        description: course.description,
        duration: course.duration,
        price: course.price,
        image_url: course_decorator.image_url,
        lessons: course_decorator.lessons,
        sales: course_decorator.sales
      }
    end
  end

  private

  attr_reader :courses
end
