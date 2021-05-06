class UserPresenter
  def initialize(user)
    @user = user
    @user_decorator = UserDecorator.new(user)
  end

  def as_json
    {
      id: user.id,
      name: user.name,
      email: user.email,
      avatar: user_decorator.image_url
    }
  end

  private

  attr_reader :user, :user_decorator
end
