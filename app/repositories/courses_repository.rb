class CoursesRepository
  def all
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
end
