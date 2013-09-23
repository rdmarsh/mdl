class AddAssetTagToDevices < ActiveRecord::Migration
  def change
    add_column :devices, :asset_tag, :string
  end
end
