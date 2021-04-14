class CoursesRepository
  def all(page = nil)
    if page
      per_page = 6
      return Course.limit(per_page).offset(per_page * (page.to_i - 1))
    end
    Course.all
  end

  def create(course_params)
    course = Course.new(course_params)
    course.save!
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
