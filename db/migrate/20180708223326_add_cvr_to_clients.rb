class AddCvrToClients < ActiveRecord::Migration[5.2]
  def change
    add_column :clients, :cvr, :string
  end
end
