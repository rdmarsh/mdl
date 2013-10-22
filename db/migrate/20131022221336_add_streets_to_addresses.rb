class AddStreetsToAddresses < ActiveRecord::Migration
  def change
    remove_column :addresses, :street_address
    add_column :addresses, :street_address_1, :string
    add_column :addresses, :street_address_2, :string
  end
end
