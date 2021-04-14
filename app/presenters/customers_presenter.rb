class CustomersPresenter
  def initialize(customers)
    @customers = customers
  end

  def as_json
    customers.map do |customer|
      {
        id: customer.id,
        name: customer.name,
        email: customer.email
      }
    end
  end

  private

  attr_reader :customers
end
