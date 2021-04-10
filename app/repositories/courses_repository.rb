class CoursesRepository
  def all
    Course.all
  end

  def create(course)
    Course.create(course)
  end

  def show(id)
    Course.find(id)
  end

  def update(id, course_params)
    course = show(id)
    course.update(course_params)
  end

  def delete(id)
    Course.destroy(id)
  end
end
