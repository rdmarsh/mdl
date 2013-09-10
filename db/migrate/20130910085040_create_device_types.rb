class CreateDeviceTypes < ActiveRecord::Migration
  def change
    create_table :device_types do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    add_index :device_types, :name, unique: true
  end
end
