class UserPresenter
  def initialize(user)
    @user = user
  end

  def as_json
    {
      id: user.id,
      name: user.name,
      email: user.email,
      role: user.role
    }
  end

  private

  attr_reader :user
end
