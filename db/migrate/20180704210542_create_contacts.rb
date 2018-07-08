class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :description
      t.string :address
      t.string :zip
      t.string :city
      t.string :phone1
      t.string :phone2
      t.string :email
      t.string :website
      t.references :client, foreign_key: true

      t.timestamps
    end
  end
end
