class AddCustomerRefToSales < ActiveRecord::Migration[6.1]
  def change
    add_reference :sales, :customer, null: false, foreign_key: true
  end
end
