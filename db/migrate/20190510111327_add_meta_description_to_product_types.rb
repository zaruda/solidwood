class AddMetaDescriptionToProductTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :product_types, :meta_description, :string
  end
end
