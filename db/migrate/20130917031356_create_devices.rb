class CreateDevices < ActiveRecord::Migration
  def change
    create_table :devices do |t|
      t.string :name
      t.text :description
      t.string :ipaddress
      
      t.timestamps
      
      t.references :device_model
      t.references :environment
      t.references :service_level
      t.references :organisation
    end
    add_index :devices, :name
  end
end
