class SalesRepository
  def all
    Sale.all
  end

  def create(sale_params)
    sale = Sale.new(sale_params)
    sale.save!
  end

  def show(id)
    Sale.find(id)
  end
end
