class CreateNetworkInterface < ActiveRecord::Migration
  def change
    create_table :network_interfaces do |t|
      t.string :name
      t.boolean  :active, :default => true
      t.boolean :dhcp, :default => false
      t.string :ipaddress
      t.string :netmask
      t.string :prefix
      t.string :broadcast
      t.string :gateway
      t.string :vlan
      t.text :description
      
      t.references :device
      t.references :network_use
      t.timestamps
    end
    add_index :network_interfaces, :name
  end
end
