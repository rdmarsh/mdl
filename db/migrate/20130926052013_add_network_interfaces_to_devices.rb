class AddNetworkInterfacesToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :network_interface_id, :integer
  end
end
