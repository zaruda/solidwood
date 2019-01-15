class DeleteSizeAndQualityFromProduct < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :size, :string
    remove_column :products, :quality, :string
  end
end
