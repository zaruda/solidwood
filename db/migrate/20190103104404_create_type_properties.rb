class CreateTypeProperties < ActiveRecord::Migration[5.2]
  def change
    create_table :type_properties do |t|
      t.references :property, foreign_key: true
      t.references :product_type, foreign_key: true

      t.timestamps
    end
  end
end
