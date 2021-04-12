class SalesPresenter
  def initialize(sales)
    @sales = sales
  end

  def as_json
    sales.map do |sale|
      {
        id: sale.id,
        customer_id: sale.customer_id,
        course_id: sale.course_id
      }
    end
  end

  private

  attr_reader :sales
end
