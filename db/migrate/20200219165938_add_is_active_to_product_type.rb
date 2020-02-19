class AddIsActiveToProductType < ActiveRecord::Migration[5.2]
  def change
    add_column :product_types, :active, :boolean, default: true
  end
end
