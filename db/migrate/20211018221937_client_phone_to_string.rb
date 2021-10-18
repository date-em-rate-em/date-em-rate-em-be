class ClientPhoneToString < ActiveRecord::Migration[5.2]
  def change
    remove_column :clients, :phone
    add_column :clients, :phone, :string
  end
end
