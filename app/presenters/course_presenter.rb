class CoursePresenter
  def initialize(course)
    @course = course
    @course_decorator = CourseDecorator.new(course)
  end

  def as_json
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

  private

  attr_reader :course, :course_decorator
end
