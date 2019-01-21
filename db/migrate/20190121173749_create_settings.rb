class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.string :email
      t.string :phone
      t.text :about
      t.string :bank
      t.string :address

      t.timestamps
    end
  end
end
