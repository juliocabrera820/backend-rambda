class InstructorCoursesPresenter
  def initialize(user)
    @user = user
  end

  def as_json
    {
      id: user.id,
      name: user.name,
      email: user.email,
      courses: user.courses
    }
  end

  private

  attr_reader :user
end
