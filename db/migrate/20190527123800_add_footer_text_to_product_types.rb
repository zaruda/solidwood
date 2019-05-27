class AddFooterTextToProductTypes < ActiveRecord::Migration[5.2]
  def change
    add_column :product_types, :additional_text, :text
  end
end
