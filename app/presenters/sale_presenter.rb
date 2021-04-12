class SalePresenter
  def initialize(sale)
    @sale = sale
  end

  def as_json
    {
      id: sale.id,
      customer_id: sale.customer_id,
      course_id: sale.course_id
    }
  end

  private

  attr_reader :sale
end
