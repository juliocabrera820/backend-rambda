class UsersRepository
  def create(user_params)
    user = User.new(user_params)
    user.save!
  end

  def show(id)
    User.find(id)
  end

  def update(id, user_params)
    user = show(id)
    user.update(user_params)
  end

  def delete(id)
    User.destroy(id)
  end

  def find_user_by_email(email)
    User.find_by(email: email)
  end

  def sales
    User.includes(:sales).all
  end
end
