class CoursesRepository
  def all
    Course.includes(:lessons, :sales).all
  end

  def create(course_params)
    course = Course.new(course_params)
    course.save!
  end

  def show(id)
    Course.includes(:lessons, :sales).find(id)
  end

  def update(id, course_params)
    course = show(id)
    course.update(course_params)
  end

  def delete(id)
    Course.destroy(id)
  end
end
