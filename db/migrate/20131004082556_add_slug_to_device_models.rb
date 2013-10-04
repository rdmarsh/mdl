class AddSlugToDeviceModels < ActiveRecord::Migration
  def change
    add_column :device_models, :slug, :string
    add_index :device_models, :slug
  end
end
