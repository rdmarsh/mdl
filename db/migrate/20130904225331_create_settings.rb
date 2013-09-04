class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string :company_name
      t.string :company_tagline
      t.string :company_phone
      t.string :company_fax
      t.string :company_email
      t.string :company_address_1
      t.string :company_address_2
      t.string :company_city
      t.string :company_postcode
      t.string :company_country

      t.timestamps
    end
  end
end
