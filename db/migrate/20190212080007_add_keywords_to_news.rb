class AddKeywordsToNews < ActiveRecord::Migration[5.2]
  def change
    add_column :news, :keywords, :text
    add_column :product_types, :keywords, :text
  end
end
