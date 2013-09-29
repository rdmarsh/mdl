class AddIndexes < ActiveRecord::Migration
  def change
    add_index :device_models, :device_type_id
    add_index :device_models, :manufacturer_id
    
    add_index :devices, :device_model_id
    add_index :devices, :environment_id
    add_index :devices, :service_level_id
    add_index :devices, :support_level_id
    add_index :devices, :organisation_id
    add_index :devices, :network_interface_id
    
    add_index :network_interfaces, :device_id
    add_index :network_interfaces, :network_use_id
  end
end
