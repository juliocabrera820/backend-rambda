class UsersPresenter
  def initialize(users)
    @users = users
  end

  def as_json
    users.map do |user|
      {
        id: user.id,
        name: user.name,
        email: user.email,
        role: user.role
      }
    end
  end

  private

  attr_reader :users
end
