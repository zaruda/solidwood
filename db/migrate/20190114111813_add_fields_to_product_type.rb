class AddFieldsToProductType < ActiveRecord::Migration[5.2]
  def change
    add_column :product_types, :description, :string
    add_column :product_types, :price, :decimal, precision: 12, scale: 3
  end
end
