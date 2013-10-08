class AddSlugToNetworkInterfaces < ActiveRecord::Migration
  def change
    add_column :network_interfaces, :slug, :string
    add_index :network_interfaces, :slug
  end
end
