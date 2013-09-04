class CreateConfigurations < ActiveRecord::Migration
  def change
    create_table :configurations do |t|
      t.string :CompanyName
      t.string :CompanyTagline
      t.string :CompanyPhone
      t.string :CompanyFax
      t.string :CompanyEmail
      t.string :CompanyAddress_1
      t.string :CompanyAddress_2
      t.string :CompanyCity
      t.string :CompanyPostCode
      t.string :CompanyCountry

      t.timestamps
    end
    add_index :configurations, :CompanyName
  end
end
