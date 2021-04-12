class AddPriceToCourses < ActiveRecord::Migration[6.1]
  def change
    add_column :courses, :price, :float
  end
end
