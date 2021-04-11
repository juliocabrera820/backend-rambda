class LessonsRepository
  def all
    Lesson.all
  end

  def create(lesson_params, course_id)
    lesson = Lesson.new(lesson_params)
    lesson.course_id = course_id
    lesson.save!
  end

  def show(id)
    Lesson.find(id)
  end

  def update(id, lesson_params)
    lesson = show(id)
    lesson.update(lesson_params)
  end

  def delete(id)
    Lesson.destroy(id)
  end
end
