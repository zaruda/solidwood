class ChangeProductTypeDescriptionType < ActiveRecord::Migration[5.2]
  def change
    change_column :product_types, :description, :text
  end
end
