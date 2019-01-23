class ChangeServiceDescriptionType < ActiveRecord::Migration[5.2]
  def change
    change_column :services, :description, :text
  end
end
