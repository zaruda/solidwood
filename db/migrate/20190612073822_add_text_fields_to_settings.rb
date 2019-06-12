class AddTextFieldsToSettings < ActiveRecord::Migration[5.2]
  def change
    add_column :settings, :application_scope_content, :text
    add_column :settings, :our_products_content, :text
    add_column :settings, :about_lumber_content, :text
  end
end
