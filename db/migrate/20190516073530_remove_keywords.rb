class RemoveKeywords < ActiveRecord::Migration[5.2]
  def change
    remove_column :pages, :keywords, :text
    remove_column :news, :keywords, :text
    remove_column :product_types, :keywords, :text
  end
end
