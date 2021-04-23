class SalesRepository
  def all(user_id)
    Sale.where(user_id: user_id)
  end

  def create(sale_params)
    sale = Sale.new(sale_params)
    sale.save!
  end

  def show(user_id, course_id)
    Sale.where(course_id: course_id, user_id: user_id)
  end
end
