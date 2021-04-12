class CustomerPresenter
  def initialize(customer)
    @customer = customer
    @customer_decorator = CustomerDecorator.new(@customer)
  end

  def as_json
    {
      id: customer.id,
      name: customer.name,
      email: customer.email,
      sales: customer_decorator.sales
    }
  end

  private

  attr_reader :customer, :customer_decorator
end
