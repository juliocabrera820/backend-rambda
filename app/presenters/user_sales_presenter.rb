class UserSalesPresenter
  def initialize(user)
    @user = user
  end

  def as_json
    {
      id: user.id,
      name: user.name,
      email: user.email,
      sales: user.sales
    }
  end

  private

  attr_reader :user
end
