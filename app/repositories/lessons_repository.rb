class LessonsRepository
  def all
    Lesson.all
  end

  def create(lesson_params, course_id)
    lesson = Lesson.new(lesson_params)
    lesson.course_id = course_id
    lesson.save!
  end

  def show(course_id, lesson_id)
    lesson = Lesson.where(course_id: course_id, id: lesson_id)
    lesson[0]
  end

  def update(lesson_params, course_id, lesson_id)
    lesson = show(course_id, lesson_id)
    lesson.update(lesson_params)
  end

  def delete(course_id, id)
    lesson = show(course_id, id)
    lesson.destroy
  end

  def course_lessons(course_id)
    Lesson.where(course_id: course_id)
  end

  def course_lesson(course_id, lesson_id)
    lessons = Lesson.where(id: lesson_id, course_id: course_id)
    lessons[0]
  end
end
