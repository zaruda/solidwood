class AddTypeToNews < ActiveRecord::Migration[5.2]
  def change
    add_column :news, :news_type, :integer
  end
end
