class CoursesRepository
  def all
    Course.all
  end

  def create(course_params, user_id)
    course = Course.new(course_params)
    course.user_id = user_id
    course.save!
  end

  def show(user_id, course_id)
    course = Course.where(user_id: user_id, id: course_id)
    course[0]
  end

  def update(course_params, user_id, course_id)
    course = show(user_id, course_id)
    course.update(course_params)
  end

  # TODO
  def delete(id)
    Course.destroy(id)
  end

  def pagination(page)
    per_page = 6
    Course.limit(per_page).offset(per_page * (page.to_i - 1))
  end

  def find_by_topic(topic)
    Course.where(topic: topic)
  end

  def find_by_programming_language(programming_language)
    Course.where(programming_language: programming_language)
  end

  def find_by_level(level)
    Course.where(level: level)
  end

  def instructor_courses(id)
    Course.where(user_id: id)
  end
end
