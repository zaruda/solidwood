class AddMetaTitleToProductType < ActiveRecord::Migration[5.2]
  def change
    add_column :product_types, :meta_title, :string
  end
end
