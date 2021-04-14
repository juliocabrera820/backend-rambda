class CustomerPresenter
  def initialize(customer)
    @customer = customer
  end

  def as_json
    {
      id: customer.id,
      name: customer.name,
      email: customer.email
    }
  end

  private

  attr_reader :customer, :customer_decorator
end
