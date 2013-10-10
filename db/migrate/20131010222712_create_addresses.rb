class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :building_number
      t.string :city
      t.string :city_prefix
      t.string :city_suffix
      t.string :country
      t.string :latitude
      t.string :longitude
      t.string :secondary_address
      t.string :state
      t.string :state_abbr
      t.string :street_address
      t.string :street_name
      t.string :street_suffix
      t.string :time_zone
      t.string :postcode

      t.timestamps
    end
  end
end
