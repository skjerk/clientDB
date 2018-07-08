class CreateClienttypes < ActiveRecord::Migration[5.2]
  def change
    create_table :clienttypes do |t|
      t.string :text

      t.timestamps
    end
  end
end
