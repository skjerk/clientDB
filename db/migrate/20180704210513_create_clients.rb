class CreateClients < ActiveRecord::Migration[5.2]
  def change
    create_table :clients do |t|
      t.string :name
      t.string :address
      t.string :zip
      t.string :city
      t.string :phone1
      t.string :phone2
      t.string :email
      t.string :website
      t.references :clienttype, foreign_key: true

      t.timestamps
    end
  end
end
