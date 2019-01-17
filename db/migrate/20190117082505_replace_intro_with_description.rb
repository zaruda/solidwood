class ReplaceIntroWithDescription < ActiveRecord::Migration[5.2]
  def change
    rename_column :news, :intro, :description
  end
end
