class ProductsProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :products_properties, id: false do |t|
      t.belongs_to :property, index: true
      t.belongs_to :product, index: true
    end
  end
end
