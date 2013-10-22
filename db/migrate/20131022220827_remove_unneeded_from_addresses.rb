class RemoveUnneededFromAddresses < ActiveRecord::Migration
  def change
    remove_column :addresses, :building_number
    remove_column :addresses, :city_prefix
    remove_column :addresses, :city_suffix
    remove_column :addresses, :secondary_address
    remove_column :addresses, :state_abbr
    remove_column :addresses, :street_name
    remove_column :addresses, :street_suffix
  end
end
