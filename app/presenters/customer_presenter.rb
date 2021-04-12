class CustomerPresenter
  def initialize(customer)
    @customer = customer
  end

  def as_json
    {
      id: customer.id,
      name: customer.name,
      email: customer.email,
      sales: customer.sales
    }
  end

  private

  attr_reader :customer
end
