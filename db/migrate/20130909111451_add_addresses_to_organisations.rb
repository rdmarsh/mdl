class AddAddressesToOrganisations < ActiveRecord::Migration
  def change
    add_column :organisations, :phone, :string
    add_column :organisations, :fax, :string
    add_column :organisations, :email, :string
    add_column :organisations, :address_1, :string
    add_column :organisations, :address_2, :string
    add_column :organisations, :city, :string
    add_column :organisations, :postcode, :string
    add_column :organisations, :country, :string
  end
end
