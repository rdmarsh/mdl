class RenameDeviceIdToSystemId < ActiveRecord::Migration
  def change
    add_column :network_interfaces, :system_id, :integer
    remove_column :network_interfaces, :device_id
    
    add_index :network_interfaces, :system_id
  end
end
