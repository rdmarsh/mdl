class AddSlugToDeviceTypes < ActiveRecord::Migration
  def change
    add_column :device_types, :slug, :string
    add_index :device_types, :slug
  end
end
