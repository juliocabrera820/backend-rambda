module CoursesHelper
  def filter_courses(params)
    return CoursesRepository.new.pagination(params[:page]) if params[:page]
    return CoursesRepository.new.find_by_topic(params[:topic]) if params[:topic]
    if params[:programming_language]
      return CoursesRepository.new.find_by_programming_language(params[:programming_language])
    end
    return CoursesRepository.new.find_by_level(params[:level]) if params[:level]

    CoursesRepository.new.all
  end
end
