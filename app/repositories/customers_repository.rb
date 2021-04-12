class CustomersRepository
  def all
    Customer.includes(:sales).all
  end

  def create(customer_params)
    customer = Customer.new(customer_params)
    customer.save!
  end

  def show(id)
    Customer.includes(:sales).find(id)
  end

  def update(id, customer_params)
    customer = show(id)
    customer.update(customer_params)
  end

  def delete(id)
    Customer.destroy(id)
  end
end
