class CreateNews < ActiveRecord::Migration[5.2]
  def change
    create_table :news do |t|
      t.string :title
      t.string :intro
      t.text :body
      t.datetime :published_at

      t.timestamps
    end
  end
end
