class CustomersPresenter
  def initialize(customers)
    @customers = customers
  end

  def as_json
    customers.map do |customer|
      customer_decorator = CustomerDecorator.new(customer)
      {
        id: customer.id,
        name: customer.name,
        email: customer.email,
        sales: customer_decorator.sales
      }
    end
  end

  private

  attr_reader :customers
end
