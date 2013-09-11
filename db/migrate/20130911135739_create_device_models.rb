class CreateDeviceModels < ActiveRecord::Migration
  def change
    create_table :device_models do |t|
      t.string :name
      t.integer :device_type_id, :integer
      t.text :description

      t.timestamps
    end
    add_index :device_models, :name, unique: true
  end
end
