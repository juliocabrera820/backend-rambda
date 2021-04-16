class UsersRepository
  def all
    User.includes(:sales).all
  end

  def create(user_params)
    user = User.new(user_params)
    user.save!
  end

  def show(id)
    User.includes(:sales).find(id)
  end

  def update(id, user_params)
    user = show(id)
    user.update(user_params)
  end

  def delete(id)
    User.destroy(id)
  end
end
