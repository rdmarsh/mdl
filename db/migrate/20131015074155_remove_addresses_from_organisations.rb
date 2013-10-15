class RemoveAddressesFromOrganisations < ActiveRecord::Migration
  def change
    remove_column :organisations, :address_1
    remove_column :organisations, :address_2
    remove_column :organisations, :city
    remove_column :organisations, :postcode
    remove_column :organisations, :state
    remove_column :organisations, :country
  end
end
