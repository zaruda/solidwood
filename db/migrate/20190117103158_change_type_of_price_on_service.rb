class ChangeTypeOfPriceOnService < ActiveRecord::Migration[5.2]
  def change
    change_column :services, :price, :string
  end
end
