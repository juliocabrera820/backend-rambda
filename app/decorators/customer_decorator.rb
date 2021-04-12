class CustomerDecorator
  def initialize(customer)
    @customer = customer
  end

  def sales
    CourseDecorator.new(customer).sales
  end

  private

  attr_reader :customer
end
