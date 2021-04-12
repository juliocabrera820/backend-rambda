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
        image_url: course.featured_image.attachment.url,
        lessons: course.lessons,
        sales: course.sales
      }
    end
  end

  private

  attr_reader :courses
end
